require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '#new_arrivals?' do
    subject do
      travel_to current_time do
        book.new_arrivals?
      end
    end

    let(:current_time) { Time.zone.now }

    context '現在のとき' do
      let(:book) { create(:book) }

      it { is_expected.to be true }
    end

    context '登録が7日前のとき' do
      let(:book) { create(:book, created_at: current_time - 7.days) }

      it { is_expected.to be true }
    end

    context '登録が8日前のとき' do
      let(:book) { create(:book, created_at: current_time - 8.days) }

      it { is_expected.to be false }
    end
  end
end
