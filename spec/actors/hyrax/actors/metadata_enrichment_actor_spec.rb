require 'rails_helper'

describe Hyrax::Actors::MetadataEnrichmentActor do
  let(:actor) do
    Hyrax::Actors::ActorStack.new(nil, ::Ability.new(nil), [described_class])
  end

  describe 'create' do
    context 'when creator is Carla Hayden' do
      let(:attributes) { { creator: 'Carla Hayden', description: '' } }
      it 'add a note to the description' do
        expect(actor.create(attributes)).to be true
        expect(attributes[:description]).to include "She's the Librarian of Congress"
      end
    end
    context 'when creator is not Carla Hayden' do
      let(:attributes) { { creator: 'John Doe', description: '' } }
      it 'returns true' do
        expect(actor.create(attributes)).to be true
        expect(attributes[:description]).not_to include "She's the Librarian of Congress"
      end
    end
  end
end
