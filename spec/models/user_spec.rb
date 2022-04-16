require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Db table' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:about).of_type(:text) }
    it { is_expected.to have_db_column(:user_role).of_type(:boolean) }
    it { is_expected.to have_db_column(:admin_role).of_type(:boolean) }
    it { is_expected.to have_db_column(:social_link).of_type(:string) }
  end

  describe 'Factory' do
    it 'is expected to have valid factory' do
      expect(FactoryBot.create(:user)).to be_valid
    end
  end

  describe 'Validations' do
    it { should have_many :posts }
  end
end
