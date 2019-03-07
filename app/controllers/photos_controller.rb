class PhotosController < ApplicationController
    def index
        @photos = Photo.order('created_at')
    end

    def new
        @photo = Photo.new
    end

    def create 
        @photo = Photo.new(photo_params)
        if @photo.save!
            flash[:notice] = "Successfully added new photo!"
            # redirect_to article_index
        else
            flash[:alert] = "Error to add new photo!"
            render :new
        end
    end

    private

    def photo_params
        params.require(:photo).permit(:title, :image)
    end
end
