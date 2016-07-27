# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Coursemology::Polyglot::Language::Python do
  describe Coursemology::Polyglot::Language::Python::Python2Point7 do
    it 'returns the correct display name' do
      expect(subject.class.display_name).to eq('Python 2.7')
    end
  end

  describe Coursemology::Polyglot::Language::Python::Python3Point4 do
    it 'returns the correct display name' do
      expect(subject.class.display_name).to eq('Python 3.4')
    end
  end

  describe Coursemology::Polyglot::Language::Python::Python3Point5 do
    it 'returns the correct display name' do
      expect(subject.class.display_name).to eq('Python 3.5')
    end
  end
end
