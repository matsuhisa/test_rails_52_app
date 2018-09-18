require 'rails_helper'

RSpec.describe BookAndNotifier, type: :model do
  describe '#save' do

    subject{ book_and_notifier.save }

    let(:book_and_notifier) { BookAndNotifier.new(book) }
    let(:slack_notification_instance) { instance_double Slack::Notifier }

    before { allow(Slack::Notifier).to receive(:new).and_return(slack_notification_instance) }

    context '成功する時' do
      let(:book) { build(:book) }

      before { allow(slack_notification_instance).to receive(:ping).and_return(true) }

      it do
        expect(slack_notification_instance).to receive(:ping)
        expect{ subject }.to change{ Book.count }.by(1)
      end
    end

    context '失敗する時' do
      let(:book) { build(:book) }

      before { allow(slack_notification_instance).to receive(:ping).and_return(false) }

      it do
        expect(slack_notification_instance).to receive(:ping)
        expect{ subject }.to change{ Book.count }.by(1)
      end
    end
  end
end
