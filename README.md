# A Jenkins Dashboard

This is a Jenkins dashboard based on [Dashing](http://shopify.github.com/dashing).

## Install Ruby w/ RVM

    $> sudo apt-get update
    $> sudo apt-get install curl
    $> curl -L https://get.rvm.io | bash -s stable
    $> source ~/.rvm/scripts/rvm
    $> rvm requirements
    $> rvm install ruby
    $> rvm use ruby --default
    $> rvm rubygems current
    $> gem install bundler
    $> gem install dashing

## Bundle & Run

Bundle:

    $> bundle install --path vendor/bundle

Run:

    $> dashing start

## Push to Dashing

Try this:

    $> curl -d \
        '{ "auth_token": "YOUR_AUTH_TOKEN", "text": "Hey, Look what I can do!" }' \
        \http://localhost:3030/widgets/welcome

## Widgets

- [build status and build progress](https://gist.github.com/mavimo/6334816)
- [Jenkins Last Commit](https://gist.github.com/kalenwatermeyer/9307200)
- [metrics from a sonar repository](https://gist.github.com/EHadoux/5196209)
- [display Sonar metrics](https://gist.github.com/aaronkaka/8491321)
- [Additional Widgets](https://github.com/Shopify/dashing/wiki/Additional-Widgets)

## Links

- [Better CI results visualization with Jenkins, Dashing and Groovy black magic](https://www.andreydevyatkin.com/archives/getting-started-with-dashing/)
