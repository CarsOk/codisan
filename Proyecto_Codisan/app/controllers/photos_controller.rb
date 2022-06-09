class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :destroy, :update]

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:alert] = "foto creada correctamente"
      redirect_to photos_path
    else
      flash[:alert] = "Error al guardar la foto"
      render :new
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    if @photo.update(photo_params)
      flash[:alert] = "foto actualizada correctamente"
      redirect_to photos_path
    else
      flash[:alert] = "Error al actualizar la foto"
      render :edit
    end
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:name_photo, :description, :avatar)
  end

end
