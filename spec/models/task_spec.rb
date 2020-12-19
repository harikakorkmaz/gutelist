require 'rails_helper'

RSpec.describe 'Taskモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { FactoryBot.create(:task) }
    let!(:task) { FactoryBot.build(:task, user_id: user.id) }
    context 'task_jaカラム' do
      it '空欄でないこと' do
        task.task_ja = ''
        expect(task.valid?).to eq false;
      end
      it '5文字以上であること' do
        task.task_ja = Faker::Lorem.characters(number:4)
        expect(task.valid?).to eq false;
      end
    end
    context 'task_enカラム' do
      it '空欄でないこと' do
        task.task_en = ''
        expect(task.valid?).to eq false;
      end
      it '5文字以上であること' do
        task.task_en = Faker::Lorem.characters(number:4)
        expect(task.valid?).to eq false;
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Task.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
