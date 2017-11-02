require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
require 'dotenv'

Dotenv.overload

CarrierWave.configure do |config|
  config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1'
  }

  config.ignore_integrity_errors = false
  config.ignore_processing_errors = false
  config.ignore_download_errors = false

  case Rails.env
  when 'production'
    config.fog_directory = 'r-ume-protospace'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/r-ume-protospace'
  when 'development'
    config.fog_directory = 'r-ume-protospace'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/r-ume-protospace'
  when 'test'
    config.storage = :file
  end
end

# 日本語の文字化けを防ぐ
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
