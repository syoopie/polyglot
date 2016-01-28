# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Coursemology::Polyglot::ConcreteLanguage do
  class self::DummyLanguage < Coursemology::Polyglot::Language
    concrete_language 'Dummy Concrete Language'
  end

  class self::DummyOverriddenNameLanguage < self::DummyLanguage
    concrete_language 'Dummy Overridden Concrete Language'

    def self.name
      'Coursemology::Polyglot::Language::Dummy::OverriddenNameLanguage'.freeze
    end
  end

  describe '.docker_image' do
    it 'removes the Coursemology::Polyglot::Language prefix' do
      expect(self.class::DummyOverriddenNameLanguage.docker_image).to \
        start_with('dummy')
    end

    it 'preserves the nesting of namespaces' do
      expect(self.class::DummyOverriddenNameLanguage.docker_image).to \
        eq('dummy-overridden_name_language')
    end

    context 'when the name contains Point surrounded by numerals' do
      class self::DummyLanguage1Point0 < self::DummyLanguage; end

      it 'converts "Point" to dots' do
        expect(self.class::DummyLanguage1Point0.docker_image).to end_with('dummy_language1.0')
      end
    end

    context 'when the name contains Point but not surrounded by numerals' do
      class self::DummyLanguagePoint < self::DummyLanguage; end

      it 'preserves "Point"' do
        expect(self.class::DummyLanguagePoint.docker_image).to end_with('dummy_language_point')
      end
    end
  end
end
