class Bookmark < ActiveRecord::Base
  belongs_to :card
  validates :card_id, presence: true
  validates :title,   presence: true
  validates :url,     presence: true
end
