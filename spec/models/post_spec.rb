require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Db table' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:content).of_type(:text) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :content }
    it { should belong_to :user }
  end
  
  describe 'Factory' do
    it 'is expected to have valid facotry' do
      user = FactoryBot.create(:user)
      expect(FactoryBot.create(:post, user: user)).to be_valid
    end
  end
end
