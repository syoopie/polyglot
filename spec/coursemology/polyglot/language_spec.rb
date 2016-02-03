# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Coursemology::Polyglot::Language do
  class self::AbstractLanguage < Coursemology::Polyglot::Language
  end

  class self::DummyLanguage < self::AbstractLanguage
    DISPLAY_NAME = 'Dummy 0.1'.freeze
    concrete_language DISPLAY_NAME
  end

  class self::DummyLanguageWithDockerImage < self::DummyLanguage
    DOCKER_IMAGE = 'dummy-docker'.freeze
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

  describe '.syntax_highlighter' do
    context 'when a default is given' do
      context 'when nothing is explicit specified' do
        class self::SyntaxHighlighterTestClass < Coursemology::Polyglot::Language
          MODE = 'test'.freeze
          syntax_highlighter MODE
        end

        subject { self.class::SyntaxHighlighterTestClass }
        it 'uses the argument for Rouge' do
          expect(subject.rouge_lexer).to eq(subject::MODE)
        end

        it 'uses the argument for Ace' do
          expect(subject.ace_mode).to eq(subject::MODE)
        end
      end

      context 'when rouge is explicitly specified' do
        class self::SyntaxHighlighterTestClass < Coursemology::Polyglot::Language
          MODE = 'test'.freeze
          ROUGE_LEXER = 'rouge'.freeze
          syntax_highlighter MODE, rouge: ROUGE_LEXER
        end

        subject { self.class::SyntaxHighlighterTestClass }
        it 'uses the argument for Rouge' do
          expect(subject.rouge_lexer).to eq(subject::ROUGE_LEXER)
        end

        it 'uses the default for Ace' do
          expect(subject.ace_mode).to eq(subject::MODE)
        end
      end

      context 'when Ace is explicitly specified' do
        class self::SyntaxHighlighterTestClass < Coursemology::Polyglot::Language
          MODE = 'test'.freeze
          ACE_MODE = 'ace'.freeze
          syntax_highlighter MODE, ace: ACE_MODE
        end

        subject { self.class::SyntaxHighlighterTestClass }
        it 'uses the default for Rouge' do
          expect(subject.rouge_lexer).to eq(subject::MODE)
        end

        it 'uses the argument for Ace' do
          expect(subject.ace_mode).to eq(subject::ACE_MODE)
        end
      end
    end

    context 'when no default is given' do
      context 'when no explicit Rouge lexer is specified' do
        it 'raises an ArgumentError' do
          expect do
            class self.class::SyntaxHighlighterTestClass < Coursemology::Polyglot::Language
              syntax_highlighter ace: 'test'
            end
          end.to raise_error(ArgumentError)
        end
      end

      context 'when no explicit Ace mode is specified' do
        it 'raises an ArgumentError' do
          expect do
            class self.class::SyntaxHighlighterTestClass < Coursemology::Polyglot::Language
              syntax_highlighter rouge: 'test'
            end
          end.to raise_error(ArgumentError)
        end
      end
    end
  end

  describe '.display_name' do
    it 'fails with NotImplementedError' do
      expect { subject.class.display_name }.to raise_error(NotImplementedError)
    end
  end

  describe '.rouge_lexer' do
    it 'fails with NotImplementedError' do
      expect { subject.class.rouge_lexer }.to raise_error(NotImplementedError)
    end
  end

  describe '.ace_mode' do
    it 'fails with NotImplementedError' do
      expect { subject.class.ace_mode }.to raise_error(NotImplementedError)
    end
  end
end
