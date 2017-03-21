require 'rails_helper'

describe 'hyrax/books/_attribute_rows.html.erb', type: :view do
  let(:ability) { double }
  let(:solr_document) do
    SolrDocument.new(
      id: 'test',
      has_model_ssim: ['Book'],
      restrictions_tesim: ['In library use only']
    )
  end
  let(:presenter) { BookPresenter.new(solr_document, ability) }

  before do
    render 'hyrax/books/attribute_rows', presenter: presenter
  end

  describe 'restrictions' do
    it 'displays restrictions' do
      expect(rendered).to have_content 'In library use only'
    end
  end
end
