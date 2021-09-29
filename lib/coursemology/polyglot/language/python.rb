# frozen_string_literal: true
class Coursemology::Polyglot::Language::Python < Coursemology::Polyglot::Language
  syntax_highlighter 'python'

  class Python2Point7 < Coursemology::Polyglot::Language::Python
    concrete_language 'Python 2.7', docker_image: 'python:2.7'
  end

  class Python3Point4 < Coursemology::Polyglot::Language::Python
    concrete_language 'Python 3.4', docker_image: 'python:3.4'
  end

  class Python3Point5 < Coursemology::Polyglot::Language::Python
    concrete_language 'Python 3.5', docker_image: 'python:3.5'
  end

  class Python3Point6 < Coursemology::Polyglot::Language::Python
    concrete_language 'Python 3.6', docker_image: 'python:3.6'
  end

  class Python3Point7 < Coursemology::Polyglot::Language::Python
    concrete_language 'Python 3.7', docker_image: 'python:3.7'
  end

  class Python3Point9 < Coursemology::Polyglot::Language::Python
    concrete_language 'Python 3.9', docker_image: 'python:3.9'
  end
end
