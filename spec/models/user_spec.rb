require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { FactoryBot.build(:user) }
    subject { test_user.valid? }
    context 'nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.name = ''
        is_expected.to eq false;
      end
      it '2文字以上であること' do
        test_user.name = Faker::Lorem.characters(number:1)
        is_expected.to eq false;
      end
      it '15文字以下であること' do
        test_user.name = Faker::Lorem.characters(number:16)
        is_expected.to eq false;
      end
    end
    context 'introductionカラム' do
      let(:test_user) { user }
      it '50文字以下であること' do
        test_user.introduction = Faker::Lorem.characters(number:51)
        is_expected.to eq false
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Taskモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:tasks).macro).to eq :has_many
      end
    end
  end
end