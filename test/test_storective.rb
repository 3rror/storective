require 'minitest/autorun'
require 'storective'

describe Storective do

  before do
    @store = Storective.new
  end

  let(:dflt_storective) { Storective.new }

  describe 'when asked about a term' do
    it 'must return an array with results' do
      @store.search_for('test').must_be_kind_of Array
    end
  end

  describe 'when you want to limit your search option' do
    it 'must allow to set the country code of the store' do
      @store.country 'IT'
      @store.country.must_equal('IT')
    end
  end
end
