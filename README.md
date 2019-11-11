# Coursemology Polyglot [![Build Status](https://travis-ci.org/Coursemology/polyglot.svg?branch=master)](https://travis-ci.org/Coursemology/polyglot)
[![Code Climate](https://codeclimate.com/github/Coursemology/polyglot/badges/gpa.svg)](https://codeclimate.com/github/Coursemology/polyglot) [![Coverage Status](https://coveralls.io/repos/Coursemology/polyglot/badge.svg?branch=master&service=github)](https://coveralls.io/github/Coursemology/polyglot?branch=master) [![Security](https://hakiri.io/github/Coursemology/polyglot/master.svg)](https://hakiri.io/github/Coursemology/polyglot/master) [![Inline docs](http://inch-ci.org/github/coursemology/polyglot.svg?branch=master)](http://inch-ci.org/github/coursemology/polyglot) [![Gem Version](https://badge.fury.io/rb/coursemology-polyglot.svg)](https://badge.fury.io/rb/coursemology-polyglot)

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

## Version 0.3 upgrade
### Breaking changes
Before version 0.3, Coursemology polyglot only supported Java 8, using docker image `coursemology/evaluator-image-java:latest`.

Version 0.3 adds support for Java 11.

To ensure old questions using Java continue to evaluate correctly, you need to run a migration to change Java's record in `polyglot_languages` table in your database.

The SQL command below summarizes the necessary changes, to be run *right before* upgrading to version 3.0:

```
UPDATE polyglot_languages SET type = 'Coursemology::Polyglot::Language::Java::Java8', name = 'Java 8'  where type = 'Coursemology::Polyglot::Language::Java';
```
