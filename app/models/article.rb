class Article < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    validates :title, presence: true,
                    length: { minimum: 5 }
    validates :user_id, presence: true

    has_many_attached :uploads

    def as_json(option = {})
        super(options.merge(include: [:user, comments: {include: :user}, likes: {include: :user}]))
    end
end
