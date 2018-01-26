require 'rubygems'
require 'bundler/setup'

require 'rspec'
require 'active_record'

require 'tokenize_attributes'

require 'support/active_record_support'
require 'support/model_support'


RSpec.configure do |config|
  config.include ModelSupport
  config.include ActiveRecordSupport, active_record: true
end
