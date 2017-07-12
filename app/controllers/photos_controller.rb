class PhotosController < ApplicationController
  before_action :authenticate_user!

 def create
    @place = Place.find(params[:place_id])
    # @photo = @place.photos.build(photo_params.merge(user: current_user))
    @photo = @place.photos.build(photo_params)

    if @photo.save
      redirect_to place_path(@place), notice: 'Photo created successfully.'
    else
      render place_path(@place)  
    end  
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :place_id, :picture)
  end
end
