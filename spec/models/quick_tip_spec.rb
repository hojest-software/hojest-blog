require 'rails_helper'

RSpec.describe QuickTip, type: :model do
  describe 'Db table' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:content).of_type(:text) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :content }
  end
  
  describe 'Factory' do
    it 'is expected to have valid factory' do
      expect(FactoryBot.create(:quick_tip)).to be_valid
    end
  end
end
