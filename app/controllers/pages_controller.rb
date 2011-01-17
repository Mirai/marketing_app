class PagesController < ApplicationController
  def home
    @title = "Home"
    @tweets = Twit.tweets
  end

  def more
    @title = "Learn More"
  end

  def pricing
    @title = "Pricing"
  end

  def contact
    @title = "Contact"
  end

end
