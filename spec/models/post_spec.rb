require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Db table' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:content).of_type(:text) }
    it { is_expected.to have_db_column(:published).of_type(:boolean) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:topics).of_type(:string) }
    it { is_expected.to have_db_column(:cover_image).of_type(:string) }
    it { is_expected.to have_db_column(:vertical_cover_image).of_type(:string) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :cover_image }
    it { is_expected.to validate_presence_of :vertical_cover_image }
    it { should belong_to :user }
  end
  
  describe 'Factory' do
    it 'is expected to have valid factory' do
      user = FactoryBot.create(:user)
      expect(FactoryBot.create(:post, user: user)).to be_valid
    end
  end
end
