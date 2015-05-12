require './alchemyapi'
alchemyapi = AlchemyAPI.new()

myText = "i can't tell whether i like or dislike my job!"

response = alchemyapi.sentiment("text", myText)
puts "Sentiment: " + response["docSentiment"]["type"]