class VoteSerializer < ActiveModel::Serializer
  attributes :id
  has_one :author
  has_one :til
end
