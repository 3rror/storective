require 'storective/version'
require 'httparty'

class Storective
  # Include & configure HTTParty
  include HTTParty
  base_uri 'https://itunes.apple.com'
  format :json

  attr_reader :settings

  def initialize(options = {})
    @settings = options
  end

  def search_for(term)
    options = @settings.merge({ term: term })
    self.class.get('/search', query: options)['results']
  end

  def enable_debug(console = $stdout)
    self.class.debug_output(console)
  end

  allowed_options = [:term, :country, :media, :entity, :attribute,
                     :callback, :limit, :lang, :version, :explicit]

  allowed_options.each do |option|
    define_method option do |*args|
      if args.empty?
        @settings[option]
      else
        @settings[option] = args.first
        self
      end
    end
  end
end
