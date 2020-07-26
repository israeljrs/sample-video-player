require 'rails_helper'

RSpec.describe Movie, type: :model do
  context 'when model movie is valid' do
    subject { build(:movie) }
    it { expect(subject).to be_valid }
  end
end
