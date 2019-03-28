class UploadsController < ApplicationController
    def delete
        @image = ActiveStorage::Blob.find(params[:upload_id])
        @image.purge

        # redirect_to root_path
    end
end