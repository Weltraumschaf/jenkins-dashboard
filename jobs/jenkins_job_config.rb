JENKINS_JOB_CONFIG = {
  :uri      => URI.parse("https://ci.weltraumschaf.de"),
  :username => nil,
  :password => nil,
  :use_ssl  => true,
  :interval => '10s',
  # the key of this mapping must be a unique identifier for your job, the according value must be the name that is specified in jenkins
  :job_mapping => {
    'caythe'      => { :job => 'Cay-The' },
    'commons'     => { :job => 'Commons' },
    'dht'         => { :job => 'DHT' },
    'groundzero'  => { :job => 'GroundZero' },
    'jvfs'        => { :job => 'jvfs' }
  }
}
