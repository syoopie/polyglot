require 'spec_helper'

RSpec.describe Coursemology::Polyglot::Language do
  class self::AbstractLanguage < Coursemology::Polyglot::Language
  end

  class self::DummyLanguage < self::AbstractLanguage
    DISPLAY_NAME = 'Dummy 0.1'
    concrete_language DISPLAY_NAME
  end

  describe '.concrete_language' do
    it 'sets the correct display name' do
      expect(self.class::DummyLanguage.display_name).to eq(self.class::DummyLanguage::DISPLAY_NAME)
    end

    it 'includes Coursemology::Polyglot::ConcreteLanguage' do
      expect(self.class::DummyLanguage.new).to \
        be_a_kind_of(Coursemology::Polyglot::ConcreteLanguage)
    end

    it 'extends Coursemology::Polyglot::ConcreteLanguage::ClassMethods' do
      expect(self.class::DummyLanguage).to \
        be_a_kind_of(Coursemology::Polyglot::ConcreteLanguage::ClassMethods)
    end
  end

  describe '.concrete_languages' do
    it 'returns a language declared as concrete' do
      expect(Coursemology::Polyglot::Language.concrete_languages).to \
        include(self.class::DummyLanguage)
    end

    it 'does not return subclasses not declared as concrete' do
      expect(Coursemology::Polyglot::Language.concrete_languages).not_to \
        include(self.class::AbstractLanguage)
    end
  end

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
