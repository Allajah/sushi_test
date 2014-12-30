require 'twitter'
require 'pry'
client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

sushi_tweets = client.search("#寿司").to_h[:statuses]
sushi_tweets.each do |tweet|
  images = tweet[:entities][:media]
  if images.class == Array
    images.each do |image|
      puts image[:media_url]
    end
  end
end
