require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when model user is valid' do
    subject { build(:user) }
    it { 
      expect(subject).to be_valid
      # expect(subject.has_role? :admin).to eq true
    }
  end

  context 'when model user is nil' do
    subject { build(:user, email: nil, password: nil) }
    it { 
      expect(subject).not_to be_valid
      expect(subject.errors[:email]).to eq ["não pode ficar em branco"] 
      expect(subject.errors[:password]).to eq ["não pode ficar em branco"] 
    }
  end

  context 'when model user is nil' do
    subject { build(:user, password: 'teste', password_confirmation: 'testando') }
    it {
      expect(subject).to_not be_valid 
      expect(subject.errors[:password]).to eq ["é muito curto (mínimo: 6 caracteres)"]
      expect(subject.errors[:password_confirmation]).to eq ["não é igual a Senha"] 
    }
  end
  
end
