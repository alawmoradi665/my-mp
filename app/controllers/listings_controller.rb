class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_listing, only: [:update, :edit, :destroy]

  def index
    @listings = Listing.all
  end

  def show
  end

  def new
    @listing = Listing.new
    
  end

  def edit
  end

  # Add current user_id to the listing
  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
  
    if @listing.save
      redirect_to @listing, notice: 'Listing was successfully created.'
    else
      render :new
    end
  end

  def update
      if @listing.update(listing_params)
        redirect_to @listing, notice: 'Listing was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @listing.destroy
    redirect_to listings_url, notice: 'Listing was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :price, :description, :measurements, :state, :city, :suburb, images: [])
    end
  end 
