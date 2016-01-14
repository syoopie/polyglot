if defined?(ActiveRecord)
  # :nocov:
  # TODO: This is for compatibility with the Web application. A future refactoring might be able
  # to remove this dependency.
  class Coursemology::Polyglot::Language < ActiveRecord::Base; end
  # :nocov:
else
  class Coursemology::Polyglot::Language; end
end

# An abstract language. This is a class which can represent a family of languages. Languages become
# concrete and can be used when that language includes +Coursemology::Polyglot::ConcreteLanguage+.
#
# Languages define their own scripts and stylesheets needed to syntax highlight code.
#
# Each subclass represents a language ancestry, such as differing language versions (see the Python
# language definition.) Derived languages can be defined at runtime to utilise the syntax
# highlighting capabilities of the root language, while requiring a separate runtime environment to
# run programs written in the derived language.
#
# Do *NOT* remove languages after they have been defined because the types specified in this
# library can have references stored in code (e.g. in a database)
class Coursemology::Polyglot::Language
  extend ActiveSupport::Autoload

  eager_autoload do
    autoload :Python
  end

  # Marks the current class as a concrete language.
  #
  # Concrete languages can be instantiated and used.
  #
  # @param [String] display_name The display name for the language
  def self.concrete_language(display_name)
    include Coursemology::Polyglot::ConcreteLanguage
    extend Coursemology::Polyglot::ConcreteLanguage::ClassMethods

    concrete_class_methods = Module.new do
      define_method(:display_name) do
        display_name
      end
    end

    extend concrete_class_methods
  end

  # Determines the concrete language subclasses of this language.
  #
  # @return [Array<Class>]
  def self.concrete_languages
    descendants.select do |klass|
      klass.ancestors.include?(Coursemology::Polyglot::ConcreteLanguage)
    end
  end

  # Gets the display name of the language.
  #
  # @abstract
  # @return [String]
  def self.display_name
    fail NotImplementedError
  end

  # The stylesheets that need to be packaged with the rest of the application.
  #
  # This should include the Rouge/Pygments stylesheet for formatting code.
  #
  # @abstract
  # @return [Array<String>]
  def self.stylesheets
    fail NotImplementedError
  end

  # The script files that need to be packaged with the rest of the application.
  #
  # This should include the Ace mode for the language.
  #
  # @abstract
  # @return [Array<String>]
  def self.javascript
    fail NotImplementedError
  end
end
