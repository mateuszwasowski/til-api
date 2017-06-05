class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name
  has_many :tils
  has_many :votes
end
