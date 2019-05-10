class User < ApplicationRecord
    has_secure_password
    scope :recent, -> { where('created_at > ?', 1.week.ago)}
    validates :email, uniqueness: true, presence: true
    has_many :articles
    has_many :likes
    has_many :liked_articles, :through => :like, :source => :article
end