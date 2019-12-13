module TokenizeAttributes
  module Attribute

    def tokenized_attributes(*attrbs)
      @method = attrbs.pop if attrbs.last.is_a?(Proc)
      attrbs.each { |attrb| tokenized_attribute(attrb, @method) }
    end

    def tokenized_attribute(attrb, method = nil)
      self.send(:define_method, 'reset_tokenization_for_#{attrb}') do
        loop {
          token = method.try(:call) || TokenizeAttributes.configuration.tokenizer.call
          self.public_send("#{attrb}=", token)
          break unless self.class.where(attrb => token).exists?
        }
      end

      before_validation do |record|
        return unless record.public_send(attrb).blank?
        record.public_send("reset_tokenization_for_#{attrb}")
      end
    end
  end
end
