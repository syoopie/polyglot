class Coursemology::Polyglot::Language::Python < Coursemology::Polyglot::Language
  class Python2Point7 < Coursemology::Polyglot::Language::Python
    class << self
      def display_name
        'Python 2.7'
      end
    end
  end

  class Python3Point4 < Coursemology::Polyglot::Language::Python
    class << self
      def display_name
        'Python 3.4'
      end
    end
  end
end
