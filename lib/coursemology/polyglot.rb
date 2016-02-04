# frozen_string_literal: true
require 'active_support/all'
require 'coursemology/polyglot/version'
require 'coursemology/polyglot/engine' if defined?(Rails)

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
