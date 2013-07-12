class Card < ActiveRecord::Base
  validates :title, presence: true
end
