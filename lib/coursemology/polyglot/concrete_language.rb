# This module is included when a Language can be directly used by the user.
#
# This is deliberately defined so that consumers of this library can inject methods into all
# concrete languages.
module Coursemology::Polyglot::ConcreteLanguage
  extend ActiveSupport::Autoload

  autoload :ClassMethods
end
