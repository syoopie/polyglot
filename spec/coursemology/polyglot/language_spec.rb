# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Coursemology::Polyglot::Language do
  class self::AbstractLanguage < Coursemology::Polyglot::Language
  end

  class self::DummyLanguage < self::AbstractLanguage
    DISPLAY_NAME = 'Dummy 0.1'
    concrete_language DISPLAY_NAME
  end

  class self::DummyLanguageWithDockerImage < self::DummyLanguage
    DOCKER_IMAGE = 'dummy-docker'
    concrete_language 'Dummy Docker Image Language', docker_image: DOCKER_IMAGE
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

    context 'when an explicit Docker image name is specified' do
      it 'returns the explicit image name' do
        expect(self.class::DummyLanguageWithDockerImage.docker_image).to \
          eq(self.class::DummyLanguageWithDockerImage::DOCKER_IMAGE)
      end
    end

    context 'when no explicit Docker image is specified' do
      it 'generates an image name' do
        expect(self.class::DummyLanguage.docker_image).to \
          eq('r_spec-example_groups-coursemology_polyglot_language-dummy_language')
      end
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
