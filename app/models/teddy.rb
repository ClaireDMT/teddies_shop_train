class Teddy < ApplicationRecord
  belongs_to :category
  monetize :price_cents
  acts_as_votable
  acts_as_voter
end
