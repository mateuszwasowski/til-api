class Til < ApplicationRecord
  belongs_to :author
  has_many :votes
  after_create :post_to_channel

  include PublishesUpdatesToPusher

  def post_to_channel
    return unless Rails.env == "production"
    HTTParty.post("https://hooks.slack.com/services/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",
    headers: { 'Content-Type' => 'application/json' },
    body: {
      text: print_til
    }.to_json)
  end

  def print_til
    "#{self.author.email} posted:
#{self.description}"
  end
end
