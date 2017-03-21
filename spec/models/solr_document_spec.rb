require 'rails_helper'

describe ::SolrDocument, type: :model do
  let(:document) { described_class.new(attributes) }
  let(:attributes) { {} }

  describe '#restrictions' do
    subject { document.restrictions }
    context 'when a value exists' do
      let(:attributes) { { restrictions_tesim: ['In library use only'] } }
      it { is_expected.to eq ['In library use only'] }
    end
    it { is_expected.to eq ['nothing'] }
  end
end
