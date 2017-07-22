class AdvertisementController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisements = Advertisement.find(params[:id])
  end

  def new
    @advertisements = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new
    @advertisement.title = params[:advertisements][:title]
    @advertisement.body = params[:advertisements][:body]
    @advertisement.price = params[:advertisements][:price]

    if @advertisement.save
      flash[:notice] = "Ad was saved."
      redirect_to @advertisement
    else
      flash.now[:alert] = "There was an error saving the ad. Please try again."
      render :new
    end
  end
end
