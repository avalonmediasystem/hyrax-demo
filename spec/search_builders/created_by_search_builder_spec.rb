require 'rails_helper'

describe CreatedBySearchBuilder do
  let(:builder) { described_class.new([:for_users], self).where(params) }
  let(:params) { { creator: 'Carla Hayden' } }

  describe '#query' do
    subject { builder.query }

    it 'filters for created by' do
      expect(subject[:fq]).to eq ["{!field f=creator_tesim v=Carla Hayden}"]
    end
  end
end
