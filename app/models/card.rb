class Card < ActiveRecord::Base
  validates :title, presence: true
  has_many :bookmarks
end
