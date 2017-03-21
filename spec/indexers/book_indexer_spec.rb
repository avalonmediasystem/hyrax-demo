require 'rails_helper'

describe BookIndexer do
  let(:indexer) { described_class.new(book) }
  let(:book) { Book.new }
  subject(:solr_document) { indexer.generate_solr_document }

  context 'with Carla Hayden' do
    let(:book) { Book.new(creator: ['Carla Hayden']) }
    it 'adds the special_message_ssm field' do
      expect(solr_document['special_message_ssm']).to include "She's the Librarian of Congress"
    end
  end

  context 'without Carla Hayden' do
    let(:book) { Book.new(creator: ['John Doe']) }
    it 'does not add the special_message_ssm field' do
      expect(solr_document['special_message_ssm']).to be_nil
    end
  end
end
