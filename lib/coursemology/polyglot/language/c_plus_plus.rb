class Coursemology::Polyglot::Language::CPlusPlus < Coursemology::Polyglot::Language
  syntax_highlighter 'cpp', ace: 'c_cpp'
  concrete_language 'C/C++', docker_image: 'c_cpp'
end
