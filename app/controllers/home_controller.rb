class HomeController < ApplicationController
  def page
    @listings = Listing.all
  end

  def about
  end
end
