require 'rails_helper'

describe BookPresenter do
  let(:solr_document) { SolrDocument.new(attributes) }
  let(:request) { double }

  let(:attributes) do
    { "id" => '888888',
      "restrictions_tesim" => ['In library use only'] }
  end
  let(:ability) { nil }
  let(:presenter) { described_class.new(solr_document, ability, request) }

  describe 'restrictions' do
    context 'with empty field' do
      let(:attributes) do
        { "id" => '888888',
          "restrictions_tesim" => ['nothing'] }
      end

      it 'returns a human readable message' do
        expect(presenter.restrictions).to eq 'There are no restrictions on this object'
      end
    end

    it 'returns the value from solr document' do
      expect(presenter.restrictions).to eq ['In library use only']
    end
  end
end
