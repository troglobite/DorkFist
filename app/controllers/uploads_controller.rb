class UploadsController < ApplicationController
    def delete
        @image = ActiveStorage::Blob.find_signed(params[:id])
        @image.purge
    end
end