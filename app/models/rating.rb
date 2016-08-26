class Rating < ApplicationRecord
  validates_presence_of :giver, :receiver, :desc
  validates_length_of :desc, minimum: 10, maximum: 140
end
