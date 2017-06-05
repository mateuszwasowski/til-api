class Vote < ApplicationRecord
  belongs_to :author
  belongs_to :til

  validate :only_one_vote_per_author

  def only_one_vote_per_author
    if Vote.where(author: self.author, til: self.til).present?
      errors.add(:author_id, "only one vote allowed per author")
    end
  end
end
