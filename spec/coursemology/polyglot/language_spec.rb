require 'spec_helper'

RSpec.describe Coursemology::Polyglot::Language do
  describe '.display_name' do
    it 'fails with NotImplementedError' do
      expect { subject.class.display_name }.to raise_error(NotImplementedError)
    end
  end

  describe '.stylesheets' do
    it 'fails with NotImplementedError' do
      expect { subject.class.stylesheets }.to raise_error(NotImplementedError)
    end
  end

  describe '.javascript' do
    it 'fails with NotImplementedError' do
      expect { subject.class.javascript }.to raise_error(NotImplementedError)
    end
  end
end
