# frozen_string_literal: true
class Coursemology::Polyglot::Language::Python < Coursemology::Polyglot::Language
  class Python2Point7 < Coursemology::Polyglot::Language::Python
    concrete_language 'Python 2.7', docker_image: 'python:2.7'
  end

  class Python3Point4 < Coursemology::Polyglot::Language::Python
    concrete_language 'Python 3.4', docker_image: 'python:3.4'
  end
end
