require 'spec_helper'

describe TokenizeAttributes::Attribute, active_record: true do
  context 'tokenized_attribute' do
    fake_active_record(:klass) do
      tokenized_attribute :authentication_token
    end

    context 'new record' do
      it 'tokenizes authentication_token' do
        record = klass.create
        expect(record.authentication_token).to be_present
      end
    end

    describe '#reset_tokenization_for_' do
      it 'changes the existing token' do
        record = klass.create
        expect do
          record.reset_tokenization_for_authentication_token
        end.to change(record, :authentication_token)
      end
    end

    context 'specify a randomize proc' do
      fake_active_record(:klass) do
        tokenized_attribute :authentication_token, proc { SecureRandom.uuid }
      end

      it 'calls the new randomizer' do
        expect(SecureRandom).to receive(:uuid).once
        klass.create
      end

      it 'does not call the defaut randomizer' do
        expect(SecureRandom).to_not receive(:hex)
        klass.create
      end
    end
  end

  context 'tokenized_attributes' do
    fake_active_record(:klass) do
      tokenized_attributes :authentication_token, :authentication_token_bis
    end

    context 'new record' do
      it 'tokenizes authentication_token and authentication_token_bis' do
        record = klass.create
        expect(record.authentication_token).to be_present
        expect(record.authentication_token_bis).to be_present
      end
    end

    context 'specify a randomize proc' do
      fake_active_record(:klass) do
        tokenized_attributes :authentication_token, :authentication_token_bis, proc { SecureRandom.uuid }
      end

      it 'calls the new randomizer' do
        expect(SecureRandom).to receive(:uuid).twice
        klass.create
      end

      it 'does not call the defaut randomizer' do
        expect(SecureRandom).to_not receive(:hex)
        klass.create
      end
    end
  end
end
