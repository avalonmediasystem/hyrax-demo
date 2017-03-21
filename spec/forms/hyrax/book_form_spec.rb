# Generated via
#  `rails generate hyrax:work Book`
require 'rails_helper'

RSpec.describe Hyrax::BookForm do
  let(:book) { Book.new }
  let(:form) { described_class.new(book, nil, nil) }

  describe "#secondary_terms" do
    subject { form.secondary_terms }
    it do
      is_expected.to include(:restrictions)
    end
  end
end
