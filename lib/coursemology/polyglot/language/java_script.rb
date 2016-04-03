class Coursemology::Polyglot::Language::JavaScript < Coursemology::Polyglot::Language
  syntax_highlighter 'javascript'
  concrete_language 'javascript', docker_image: 'javascript'
end
