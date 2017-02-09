# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Coursemology::Polyglot::Language::CPlusPlus do
  describe Coursemology::Polyglot::Language::CPlusPlus do
    it 'returns the correct display name' do
      expect(subject.class.display_name).to eq('C/C++')
    end
  end
end
