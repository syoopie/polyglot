# Coursemology Polyglot [![Build Status](https://travis-ci.org/Coursemology/polyglot.svg?branch=master)](https://travis-ci.org/Coursemology/polyglot)
[![Code Climate](https://codeclimate.com/github/Coursemology/polyglot/badges/gpa.svg)](https://codeclimate.com/github/Coursemology/polyglot) [![Coverage Status](https://coveralls.io/repos/Coursemology/polyglot/badge.svg?branch=master&service=github)](https://coveralls.io/github/Coursemology/polyglot?branch=master) [![Security](https://hakiri.io/github/Coursemology/polyglot/master.svg)](https://hakiri.io/github/Coursemology/polyglot/master) [![Inline docs](http://inch-ci.org/github/coursemology/polyglot.svg?branch=master)](http://inch-ci.org/github/coursemology/polyglot)

This is the library common between the web application and the evaluator for determining the 
programming languages supported in Coursemology.

## Usage
### With Rails
The library works with Railties, so there is no special configuration.

The gem provides a JavaScript asset which can be used to require all Ace modes that are needed by
all concrete languages. In your application manifest, include this:

```javascript
//= require coursemology/polyglot/ace-modes
```

Ensure that Ace is found within the `ace` directory (i.e. `ace/mode-python.js` etc.)

### Without Rails
In your `Gemfile`:
```ruby
gem 'coursemology-polyglot'
```

Then, in your application:
```ruby
Coursemology::Polyglot.eager_load!
```

The Polyglot library needs to be eager loaded so that it knows which languages are defined. 
Otherwise, the list of `concrete_languages` will be empty.
