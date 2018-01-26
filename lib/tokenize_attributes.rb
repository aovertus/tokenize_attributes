require 'tokenize_attributes/configuration'
require 'tokenize_attributes/version'
require 'tokenize_attributes/attribute'

# Load rails support
require 'simple_enum/railtie' if defined?(Rails)

module TokenizeAttributes
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
