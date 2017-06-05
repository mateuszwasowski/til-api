class Author < ApplicationRecord
  has_many :tils
  has_many :votes

  def voted?(til)
    til.votes.where(author_id: id).any?
  end
end
