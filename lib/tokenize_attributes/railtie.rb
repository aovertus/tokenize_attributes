require 'tokenize_attributes'

module TokenizeAttributes
  class Railtie < Rails::Railtie

    initializer 'tokenize_attributes.extend_active_record' do
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.send :extend, TokenizeAttributes::Attribute
      end
    end
  end
end
