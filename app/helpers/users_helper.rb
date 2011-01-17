module UsersHelper
  def output_tweets(tweets)
    html = ""
    5.times do |x|
      html << "<p>#{tweets[x].text} (Created #{time_ago_in_words(DateTime.parse(tweets[x].created_at))} ago)</p>"
    end
    html
  end
end
