class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_listing, only: [:update, :edit, :destroy]

  # GET /listings or /listings.json
  def index
    @listings = Listing.all
    
  end

  # GET /listings/1 or /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
    
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    # @listing = current_user.listings.new(listing.params)
  

    if @listing.save
      redirect_to @listing, notice: 'Listing was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    
      if @listing.update(listing_params)
        redirect_to @listing, notice: 'Listing was successfully updated.'
      else
        render :edit
      end
     
  end

  # DELETE /listings/1 or /listings/1.json
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

    def authorize_listing
      unless @listing.user == current_user 
        redirect_to root_path, notice: 'You are not authorized'
      end
    end
end
