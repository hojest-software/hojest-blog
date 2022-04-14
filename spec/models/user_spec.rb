require 'rails_helper'

RSpec.describe User, type: :model do  
  describe 'Factory' do
    it 'is expected to have valid facotry' do
      expect(FactoryBot.create(:user)).to be_valid
    end
  end

  describe 'Validations' do
    it { should have_many :posts }
  end
end
