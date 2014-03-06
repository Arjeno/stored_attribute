# stored_attribute

[![Gem Version](https://badge.fury.io/rb/retina_rails.png)](http://badge.fury.io/rb/stored_attribute) [![Build Status](https://secure.travis-ci.org/Arjeno/stored_attribute?branch=master)](http://travis-ci.org/Arjeno/stored_attribute) [![Coverage Status](https://coveralls.io/repos/Arjeno/stored_attribute/badge.png?branch=master)](https://coveralls.io/r/Arjeno/stored_attribute) [![Code Climate](https://codeclimate.com/github/Arjeno/stored_attribute.png)](https://codeclimate.com/github/Arjeno/stored_attribute) [![Dependency Status](https://gemnasium.com/Arjeno/stored_attribute.png)](https://gemnasium.com/Arjeno/stored_attribute)

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