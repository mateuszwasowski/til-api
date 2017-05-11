class Til < ApplicationRecord
  belongs_to :author

  include PublishesUpdatesToPusher
end
