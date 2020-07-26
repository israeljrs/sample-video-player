require 'rails_helper'

RSpec.describe MovieView, type: :model do
  context 'when model movie view is valid' do
    subject { build(:movie_view) }
    it { expect(subject).to be_valid }
  end
end
