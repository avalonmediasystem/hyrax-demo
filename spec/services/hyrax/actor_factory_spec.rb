require 'rails_helper'

describe Hyrax::ActorFactory, :no_clean do
  let(:work) { Book.new }

  describe '.stack_actors' do
    subject { described_class.stack_actors(work) }
    it do
      is_expected.to include Hyrax::Actors::MetadataEnrichmentActor
    end
  end
end
