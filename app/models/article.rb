class Article < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    validates :title, presence: true,
                    length: { minimum: 5 }

    def as_json(option = {})
        super(options.merge(include: [:user, comments: {include: :user}]))
    end
end
