class BookAndNotifier
  attr_accessor :book

  def initialize(book)
    @book = book
  end

  def save
    book.save
    slack_notifier
  end

  private

    def slack_notifier
      notifier = Slack::Notifier.new(ENV['SLACK_WEBHOOK_URL'], channel: "#general", username: "notifier")
      notifier.ping "新着です！ -> #{book.title}"
    end
end
