class AvatarController < ApplicationController
    def new
        @user = current_user.id
    end

    def edit  
        @avatar = User.find(params[user_id]).avatar
    end
end