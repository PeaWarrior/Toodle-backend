class ImagesController < ApplicationController
    def create
      img = Image.create(img_params)
      render json: img
    end

    def show
      img = Image.find(params[:id])
      render json: img
    end

    private

    def img_params
      params.require(:image).permit(:user_id, :art)
    end
end
