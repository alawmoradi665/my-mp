class HomeController < ApplicationController
  def page
    @listings = Listing.all
  end

  def about
    @listings = Listing.user_id
  end

end
