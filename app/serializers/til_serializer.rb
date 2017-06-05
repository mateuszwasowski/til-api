class TilSerializer < ActiveModel::Serializer
  attributes :id, :description
  has_one :author
  has_many :votes
end
