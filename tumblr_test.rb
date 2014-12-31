require 'tumblr_client'

Tumblr.configure do |config|
  config.consumer_key = ""
  config.consumer_secret = ""
  config.oauth_token = ""
  config.oauth_token_secret = ""
end

client = Tumblr::Client.new
sushi_posts = client.tagged("コスプレ",{})
sushi_posts.each do |post|
  if(post["type"] == "photo")
    post["photos"].each do |sushi_potho|
      puts sushi_potho["alt_sizes"][2]["url"]
    end
  end
end
