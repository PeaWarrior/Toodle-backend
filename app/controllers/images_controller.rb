class ImagesController < ApplicationController
    def create
      img = Image.create(img_params)
      render json: img
    end

    def show
      img = Image.find(params[:id])
      render json: img
    end

    def update
      img = Image.find(params[:id])
      img.update(img_params)
      render json: img
    end

    def destroy
      img = Image.find(params[:id])
      img.destroy
      render json: {message: "#{img.title} has been deleted."}
    end

    private

    def img_params
      params.require(:image).permit(:user_id, :art, :title)
    end
end
