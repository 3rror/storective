[![Code Climate](https://codeclimate.com/github/buglite/storective/badges/gpa.svg)](https://codeclimate.com/github/buglite/storective)
[![Build Status](https://travis-ci.org/buglite/storective.svg?branch=master)](https://travis-ci.org/buglite/storective)

# Storective

Ruby wrapper for the Apple Search API. It makes easy searching for movies,
podcasts, music, music videos, audio books, short films, tv shows, softwares
and ebooks on the iTunes Store, App Store, iBook Store and Mac App Store by term
or by id.

## Installation

*Currently not available outside Github*, at least until we have a beta.

Add this line to your application's Gemfile:

```ruby
gem 'storective'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install storective

## Usage

If you want to search for a generic term, it's so easy:

```ruby
s = Storective.new
s.search_for('your favorite song')
```

But also if you want to set any option:

```ruby
s = Storective.new
s.limit(1).country('IT').search_for('your favorite song')
```

you can also initialize the instance with your options:

```ruby
s = Storective.new limit: 1, country: 'IT'
s.search_for('your favorite song')
```
*See [Apple website](https://www.apple.com/itunes/affiliates/resources/documentation/itunes-store-web-service-search-api.html) for the complete options list*

## ToDo
* Implement search by ID
* Code documentation

## Contributing

1. Fork it ( https://github.com/buglite/storective/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

### Legal notes

Apple, iTunes Store, App Store, iBookstore and Mac App Store are trademarks of
Apple Inc.