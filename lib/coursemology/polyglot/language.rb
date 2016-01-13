if defined?(ActiveRecord)
  # :nocov:
  # TODO: This is for compatibility with the Web application. A future refactoring might be able
  # to remove this dependency.
  class Coursemology::Polyglot::Language < ActiveRecord::Base; end
  # :nocov:
else
  class Coursemology::Polyglot::Language; end
end

class Coursemology::Polyglot::Language
  extend ActiveSupport::Autoload

  eager_autoload do
    autoload :Python
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
