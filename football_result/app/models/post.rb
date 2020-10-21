class Post < ApplicationRecord
  validates :hometeam, presence: true
  validates :awayteam, presence: true
  validates :hr, presence: true
  validates :ar, presence: true


end
