require 'minitest/autorun'
require 'storective'

describe Storective do

  let(:default_store) do
     Storective.new
  end

  describe 'when you want to search for a term' do
    it 'must return an array with the results' do
      #skip # because it can really slow down tests
      default_store.search_for('Jack Johnson').must_be_kind_of Array
    end
  end

  describe 'when you want to set an option for your search' do
    it 'must allow you to do it with method-chain' do
      default_store.country('IT').limit(1).must_be_instance_of Storective
    end

    it 'must allow you to do it during the initialization' do
      Storective.new(country: 'IT', limit: 1).must_be_instance_of Storective
    end
  end

  it 'must allow you to get a previously setted option' do
    default_store.country 'IT'
    default_store.country.must_equal('IT')
  end

  it "must allow you to list all the settings" do
    default_store.settings.must_be_kind_of Hash
  end

  describe 'when you want to search by ID' do
    it "must allow you to specify if it's the artist ID" do
      skip
      default_store.search_artist_by_ID 909253
    end

    it "must allow you to specify if it's the album ID" do
      skip
      default_store.search_album_by_ID 120954021
    end

    it "must allow you to specify if it's the collection ID" do
      skip
      default_store.search_collection_by_ID 120954021
    end

    it "must allow you to specify if it's the track ID" do
      skip
      default_store.search_track_by_ID 120954021
    end
  end
end
