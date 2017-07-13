class Coursemology::Polyglot::Language::Java < Coursemology::Polyglot::Language
  syntax_highlighter 'java'
  concrete_language 'Java', docker_image: 'java'
end
