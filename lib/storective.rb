require 'storective/version'
require 'net/http'
require 'json'

class Storective
  attr_reader :settings

  def initialize(params = {})
    @settings = params
  end

  def search_for(term, params = {})
    all_params = merge_all @settings, params,  term: term
    uri = URI('https://itunes.apple.com/search')
    uri.query = URI.encode_www_form(all_params)
    res = Net::HTTP.get_response(uri)
    JSON.parse(res.body)['results']
  end

  allowed_params = [:term, :country, :media, :entity, :attribute,
                    :callback, :limit, :lang, :version, :explicit]

  allowed_params.each do |param|
    define_method param do |*args|
      if args.empty?
        @settings[param]
      else
        @settings[param] = args.first
        self
      end
    end
  end

  private

  def merge_all(*args)
    args.reduce(&:merge)
  end
end
