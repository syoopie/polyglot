class Coursemology::Polyglot::Language::Java < Coursemology::Polyglot::Language
  syntax_highlighter 'java'

  class Java8 < Coursemology::Polyglot::Language::Java
    concrete_language 'Java 8', docker_image: 'java:8'
  end

  class Java11 < Coursemology::Polyglot::Language::Java
    concrete_language 'Java 11', docker_image: 'java:11'
  end

  class Java17 < Coursemology::Polyglot::Language::Java
    concrete_language 'Java 17', docker_image: 'java:17'
  end
end
