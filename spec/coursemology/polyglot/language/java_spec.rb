# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Coursemology::Polyglot::Language::Java do
  describe Coursemology::Polyglot::Language::Java::Java8 do
    it 'returns the correct display name' do
      expect(subject.class.display_name).to eq('Java 8')
    end
  end

  describe Coursemology::Polyglot::Language::Java::Java11 do
    it 'returns the correct display name' do
      expect(subject.class.display_name).to eq('Java 11')
    end
  end

  describe Coursemology::Polyglot::Language::Java::Java17 do
    it 'returns the correct display name' do
      expect(subject.class.display_name).to eq('Java 17')
    end
  end
end
