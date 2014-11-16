[![Code Climate](https://codeclimate.com/github/buglite/storective/badges/gpa.svg)](https://codeclimate.com/github/buglite/storective)

# Storective

Ruby wrapper for the Apple Search API. It makes easy searching for movies,
podcasts, music, music videos, audio books, short films, tv shows, softwares
and ebooks on the iTunes Store, App Store, iBook Store and Mac App Store by term
or by id.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'storective'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install storective

## Usage

Search for a term:
```ruby
s = Storective.new
s.search_for('your favorite song')
```

Setting options (see [Apple website](https://www.apple.com/itunes/affiliates/resources/documentation/itunes-store-web-service-search-api.html) for information about options)
```ruby
s = Storective.new
s.limit(1).country('IT').search_for('your favorite song')
```

```ruby
s2 = Storective.new limit: 1, country 'IT'
s2.search_for('your favorite song')
```
TODO: Write more usage instructions here

## Contributing

1. Fork it ( https://github.com/buglite/storective/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

### Legal notes

iTunes Store, App Store, iBookstore and Mac App Store are trademarks of
Apple Inc.