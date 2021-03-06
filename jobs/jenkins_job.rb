require 'net/http'
require 'json'
require 'time'

require_relative 'jenkins_job_config'

def get_number_of_failing_tests(job_name)
  info = get_json_for_job(job_name, 'lastCompletedBuild')
  info['actions'][4]['failCount']
end

def get_completion_percentage(job_name)
  build_info = get_json_for_job(job_name)
  prev_build_info = get_json_for_job(job_name, 'lastCompletedBuild')

  return 0 if not build_info["building"]
  last_duration = (prev_build_info["duration"] / 1000).round(2)
  current_duration = (Time.now.to_f - build_info["timestamp"] / 1000).round(2)
  return 99 if current_duration >= last_duration
  ((current_duration * 100) / last_duration).round(0)
end

def get_json_for_job(job_name, build = 'lastBuild')
  job_name = URI.encode(job_name)
  http = Net::HTTP.new(JENKINS_JOB_CONFIG[:uri].host, JENKINS_JOB_CONFIG[:uri].port)
  request = Net::HTTP::Get.new("/job/#{job_name}/#{build}/api/json")

  if JENKINS_JOB_CONFIG[:use_ssl]
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end

  if JENKINS_JOB_CONFIG[:username]
    request.basic_auth(JENKINS_JOB_CONFIG[:username], JENKINS_JOB_CONFIG[:password])
  end

  response = http.request(request)
  JSON.parse(response.body)
end

JENKINS_JOB_CONFIG[:job_mapping].each do |title, jenkins_project|
  current_status = nil

  SCHEDULER.every JENKINS_JOB_CONFIG[:interval], :first_in => 0 do |job|
    last_status = current_status
    build_info = get_json_for_job(jenkins_project[:job])
    current_status = build_info["result"]

    if build_info["building"]
      current_status = "BUILDING"
      percent = get_completion_percentage(jenkins_project[:job])
    elsif jenkins_project[:pre_job]
      pre_build_info = get_json_for_job(jenkins_project[:pre_job])
      current_status = "PREBUILD" if pre_build_info["building"]
      percent = get_completion_percentage(jenkins_project[:pre_job])
    end

    send_event(title, {
      currentResult: current_status,
      lastResult: last_status,
      timestamp: build_info["timestamp"],
      value: percent
    })
  end
end
