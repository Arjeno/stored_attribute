# stored_attribute

[![Gem Version](https://badge.fury.io/rb/retina_rails.png)](http://badge.fury.io/rb/stored_attribute) [![Build Status](https://secure.travis-ci.org/Arjeno/stored_attribute.png?branch=master)](http://travis-ci.org/Arjeno/stored_attribute) [![Coverage Status](https://coveralls.io/repos/Arjeno/stored_attribute/badge.png?branch=master)](https://coveralls.io/r/Arjeno/stored_attribute) [![Code Climate](https://codeclimate.com/github/Arjeno/stored_attribute.png)](https://codeclimate.com/github/Arjeno/stored_attribute) [![Dependency Status](https://gemnasium.com/Arjeno/stored_attribute.png)](https://gemnasium.com/Arjeno/stored_attribute)

A simple extension to ActiveRecord for type casting serialized stored attributes using the `store` (introduced in Rails 3.2.0) method.

## Usage

Add to your Gemfile:

```ruby
gem 'stored_attribute'
```

## Example code

```ruby
class Post < ActiveRecord::Base
  store :data, :accessors => [:show_date, :show_author, :background_color]

  attribute :show_date,         :type => :boolean,  :default => false
  attribute :show_author,       :type => :boolean,  :default => true
  attribute :background_color,  :type => :string,   :default => '#FFFFFF'
end

post = Post.create
post.show_date # => false

post.update_attributes({ :show_date => true })
post.show_date # => true
```

Supported Ruby Versions
------------

This library is tested against Travis and aims to support the following Ruby
implementations:

* Ruby 1.9.2
* Ruby 1.9.3
* Ruby 2.0.0
* Ruby 2.1.1

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Copyright
------------

Copyright (c) 2012-2014 Arjen Oosterkamp. See LICENSE for details.
