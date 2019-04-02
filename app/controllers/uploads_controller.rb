class UploadsController < ApplicationController
    def delete_upload
        @image = @image = Article.find(params[:id]).uploads
        @image.purge

        # redirect_to root_path
    end
end