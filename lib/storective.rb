require 'storective/version'
require 'httparty'

class Storective
  # Include & configure HTTParty
  include HTTParty
  base_uri 'https://itunes.apple.com'
  format :json

  attr_accessor :settings

  def initialize(settings = {})
    @settings = settings
  end

  def method_missing(meth, *args, &blk)
    if param_permitted? meth
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

  def search_for(term)
    options = @settings.merge({ term: term })
    self.class.get('/search', query: options)['results']
  end

  def enable_debug
    self.class.debug_output $stdout
  end

  private

  def param_permitted?(param)
    allowed_params = [:term, :country, :media, :entity, :attribute,
                      :callback, :limit, :lang, :version, :explicit]
    allowed_params.include? param
  end
end
