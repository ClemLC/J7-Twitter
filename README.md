# DA BOT

## Que fait ce bot ?

Ce bot stream les tweets contenant "coder en Ruby", pourquoi ? Parce que comme ça on like le tweet et dans la foulée on tweet un message avec l'ID de celui dont vient le tweet !

## Comment il fonctionne ?

### D'abord on crée notre app twitter et on répond à quelques questions

    puts "Consumer Key ?"
    twitter_consumer_key = gets.chomp
    puts "Consumer secret Key ?"
    twitter_consumer_secret = gets.chomp
    puts "Access token ?"
    twitter_access_token = gets.chomp
    puts "Access Token Secret ?"
    witter_access_token_secret = gets.chomp

### Ensuite on stream

    topics = ["coder en Ruby"]
      client.filter(track: topics.join(",")) do |object|

        puts "#{object.user.screen_name}: #{object.text}" if object.is_a?(Twitter::Tweet)


**Et on passe à l'action !**

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = twitter_consumer_key
      config.consumer_secret     = twitter_consumer_secret
      config.access_token        = twitter_access_token
      config.access_token_secret = twitter_access_token_secret
    end

**On like...**

    client.favorite(object)

**On tweet en reprenant l'ID du tweeter (twitté !)**

          client.update("@#{object.user.screen_name}"+" Toi aussi tu apprends à coder chez @/the_hacking_pro ?")
        end
      end
