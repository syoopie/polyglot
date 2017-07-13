# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Coursemology::Polyglot::Language::Java do
  describe Coursemology::Polyglot::Language::Java do
    it 'returns the correct display name' do
      expect(subject.class.display_name).to eq('Java')
    end
  end
end
