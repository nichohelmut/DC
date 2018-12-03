class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @image = Image.new
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @image = Image.new
  end

  def edit
  end

  def create
    @user = User.find(params[:user_id])
    @image = Image.new(image_params)
    @image.user = @user

    if @image.save
      redirect_to user_path(@user), notice: 'Image was successfully created.'
    else
      render :new
    end
  end

  def update
    if @image.update(image_params)
      redirect_to @image, notice: 'Image was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @image.destroy
    redirect_to images_url, notice: 'Image was successfully destroyed.'
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:description)
    end
end
