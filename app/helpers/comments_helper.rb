module CommentsHelper
    def displayCommentOptions(comment)
        if current_user.id == comment.user.id
            return true
        end
    end
end
