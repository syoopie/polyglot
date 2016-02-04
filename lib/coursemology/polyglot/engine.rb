# frozen_string_literal: true
class Coursemology::Polyglot::Engine < Rails::Engine
  def self.eager_load!
    super
    Coursemology::Polyglot.eager_load!
  end

  # :nocov:
  # These are Railties callbacks, which we can't trigger in specs specifically.
  def self.initialize_engine(_)
    Coursemology::Polyglot::Language.eager_load!
  end

  def self.after_initialize(_)
    return if !Coursemology::Polyglot::Language.connected? ||
              !Coursemology::Polyglot::Language.table_exists?

    Coursemology::Polyglot::Language.load_languages
  end
  # :nocov:

  initializer('coursemology.polyglot', &method(:initialize_engine))
  config.after_initialize(&method(:after_initialize))
end
