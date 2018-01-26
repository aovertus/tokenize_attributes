module TokenizeAttributes
  class Configuration
    attr_accessor :tokenizer

    def initialize
      @tokenizer = proc { SecureRandom.hex }
    end
  end
end
