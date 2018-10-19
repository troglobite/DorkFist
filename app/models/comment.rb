class Comment < ApplicationRecord
    belongs_to :article
    belongs_to :user

    def as_json(options = {})
        super(options.merge(include: :user))
    end
end
