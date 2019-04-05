class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true, presence: true

    has_many :likes
    has_many :liked_articles, :through => :like, :source => :article

    has_one_attached :avatar
end