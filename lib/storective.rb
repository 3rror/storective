require 'storective/version'
require 'httparty'

class Storective
  # Include & configure HTTParty
  include HTTParty
  base_uri 'https://itunes.apple.com'
  format :json

  attr_accessor :settings

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

  private

  def method_missing(meth, *args, &blk)
    # Check if meth is a settable option
    if allowed_params? meth
      if args.empty?
        @settings[meth]
      else
        @settings[meth] = args.first
        self
      end
    else
      super
    end
  end

  def allowed_params?(param)
    allowed_params = [:term, :country, :media, :entity, :attribute,
                      :callback, :limit, :lang, :version, :explicit]
    allowed_params.include? param
  end
end
