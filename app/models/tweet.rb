class Tweet < ApplicationRecord
  before_create :change_tweet
  validates :text, presence: true
  belongs_to :user
  has_many :comments

  def self.search(search)
    return Tweet.all unless search
    Tweet.where('text LIKE(?)', "%#{search}%")
  end

  def change_tweet
    self.text = text + "!!"
  end
end
