require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ''
  config.consumer_secret = ''
  config.access_token = ''
  config.access_token_secret = ''
end

text = File.readlines("text.txt")
pics = (Dir.entries("pics") - %w[.. . .DS_Store]).sort()

i = 0
text.each do |t|
  puts t
  client.update_with_media(t, File.new("pics/"+pics[i]))
  i +=1
  sleep(3)
end