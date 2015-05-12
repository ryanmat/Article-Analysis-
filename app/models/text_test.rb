require './alchemyapi'
alchemyapi = AlchemyAPI.new()

# myText = "i can't tell whether i like or dislike!"
myUrl = "http://www.nytimes.com/2015/05/13/business/dealbook/verizon-to-buy-aol-for-4-4-billion.html?hp&action=click&pgtype=Homepage&module=first-column-region&region=top-news&WT.nav=top-news&_r=0"

response = alchemyapi.entities("url", myUrl, {'sentiment'=>1})
# puts "type: " + response["docSentiment"]["type"]

if response['status'] == 'OK'
	puts '## Response Object ##'
	puts JSON.pretty_generate(response)


	puts ''
	puts '## Entities ##'
	for entity in response['entities']
		puts 'text: ' + entity['text']
		puts 'type: ' + entity['type']
		puts 'relevance: ' + entity['relevance']
		print 'sentiment: ' + entity['sentiment']['type'] 
		
		#Make sure score exists (it's not returned for neutral sentiment
		if entity['sentiment'].key?('score')
			print ' (' + entity['sentiment']['score'] + ')'
		end

		puts ''
	end
else
	puts 'Error in entity extraction call: ' + response['statusInfo']
end

