# Generated via
#  `rails generate hyrax:work Book`
require 'rails_helper'

RSpec.describe Hyrax::BooksController do
  describe 'show_presenter' do
    it 'uses the book presenter' do
      expect(described_class.show_presenter).to eq BookPresenter
    end
  end
end
