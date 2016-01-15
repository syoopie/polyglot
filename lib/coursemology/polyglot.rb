require 'active_support/all'
require 'coursemology/polyglot/version'

module Coursemology::Polyglot
  extend ActiveSupport::Autoload

  eager_autoload do
    autoload :Language
    autoload :ConcreteLanguage
  end

  def self.eager_load!
    super
    Coursemology::Polyglot::Language.eager_load!
  end
end
