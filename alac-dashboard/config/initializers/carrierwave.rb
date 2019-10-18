CarrierWave.configure do |config|
  config.storage    =  :aws

  config.permissions = 0644

  config.enable_processing = false if Rails.env.test?


  config.aws_bucket = ENV['AWS_BUCKET'] # for AWS-side bucket access permissions config, see section below
  config.aws_acl    = 'public-read'

  config.aws_credentials = {
    access_key_id:    ENV['AWS_KEY'],
    secret_access_key: ENV['AWS_ACCESS'],
    region:            "us-east-1",#ENV['S3_REGION_SC'], # Required
    stub_responses:    Rails.env.test? # Optional, avoid hitting S3 actual during tests
  }


end