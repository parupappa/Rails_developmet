class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :hometeam, presence: true
  validates :awayteam, presence: true
  validates :hr, presence: true
  validates :ar, presence: true


end
