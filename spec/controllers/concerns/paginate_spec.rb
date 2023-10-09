require 'rails_helper'
require 'will_paginate/array'

RSpec.describe Pagination do
  class DummyClass
    include Pagination

    def initialize(params)
      @params = params
    end

    def paginate_collection(collection)
      paginate.call(collection)
    end

    private

    attr_reader :params
  end

  let(:params) { {} }
  let(:collection) { (1..10).to_a }

  subject { DummyClass.new(params) }

  describe '#paginate_collection' do
    context 'when page and per_page are not specified' do
      it 'paginates with default values' do
        paginated = subject.paginate_collection(collection)
        expect(paginated).to eq(collection.paginate(page: 1, per_page: Pagination::DEFAULT_PER_PAGE))
      end
    end

    context 'when page and per_page are specified in params' do
      let(:params) { { page: 2, per_page: 3 } }

      it 'paginates with specified values' do
        paginated = subject.paginate_collection(collection)
        expect(paginated).to eq(collection.paginate(page: 2, per_page: 3))
      end
    end

    context 'when only page is specified in params' do
      let(:params) { { page: 3 } }

      it 'paginates with specified page and default per_page' do
        paginated = subject.paginate_collection(collection)
        expect(paginated).to eq(collection.paginate(page: 3, per_page: Pagination::DEFAULT_PER_PAGE))
      end
    end

    context 'when only per_page is specified in params' do
      let(:params) { { per_page: 5 } }

      it 'paginates with specified per_page and default page' do
        paginated = subject.paginate_collection(collection)
        expect(paginated).to eq(collection.paginate(page: 1, per_page: 5))
      end
    end
  end
end
