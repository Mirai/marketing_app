require "twitter"

class Twit
  def self.tweets
    Rails.cache.fetch("tweets", :expires_in => 5.minutes) do
      Twitter.user_timeline("cadwallion")
    end 
  end
end
