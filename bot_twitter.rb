require 'pry'

puts "Consumer Key ?"
twitter_consumer_key = gets.chomp
puts "Consumer secret Key ?"
twitter_consumer_secret = gets.chomp
puts "Access token ?"
twitter_access_token = gets.chomp
puts "Access Token Secret ?"
twitter_access_token_secret = gets.chomp


require 'twitter'
#On lance le streaming...
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = twitter_consumer_key
  config.consumer_secret     = twitter_consumer_secret
  config.access_token        = twitter_access_token
  config.access_token_secret = twitter_access_token_secret
end


binding.pry
#...et on décide de streamer tous les tweets contenants "coder en Ruby"
topics = ["coder en Ruby"]
client.filter(track: topics.join(",")) do |object|

  puts "#{object.user.screen_name}: #{object.text}" if object.is_a?(Twitter::Tweet)

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = twitter_consumer_key
      config.consumer_secret     = twitter_consumer_secret
      config.access_token        = twitter_access_token
      config.access_token_secret = twitter_access_token_secret
    end
    client.favorite(object)#ici on like leurs posts
    client.update("@#{object.user.screen_name}"+" Toi aussi tu apprends à coder chez @the_hacking_pro ?")#et là on tweet un message avec leur ID
  end
end
