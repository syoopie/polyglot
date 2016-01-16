# This module is extended by the language's singleton class when the Language can be directly used
# by the user.
#
# This is deliberately defined so that consumers of this library can inject methods into all
# concrete languages' classes.
module Coursemology::Polyglot::ConcreteLanguage::ClassMethods
  # The default algorithm for translating a language to a corresponding Docker image name.
  #
  # This will:
  #  1. Strip the +Coursemology::Polyglot::Language+ prefix.
  #  2. Underscore the name.
  #  3. Replace *n*Point*n* strings with dots (e.g. Python2Point7 to Python2.7).
  #  4. Replace slashes with dashes.
  def docker_image
    # Remove the Coursemology::Polyglot::Language prefix
    class_name = name
    class_name = class_name.sub(/^Coursemology::Polyglot::Language::/, '')

    # Use the underscored name
    class_name = class_name.underscore

    # Replace the "_point" string with a decimal
    class_name.gsub!(/(?<=[\d])_point(?=[\d])/, '.')

    # Replace slashes with dashes
    class_name.tr!('/', '-')
    class_name
  end
end
