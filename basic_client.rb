require_relative 'bot_class'

bot = Bot.new(:name => 'Fred', :data_file => 'fred.bot')

puts bot.greeting

while input = gets and input.chomp != 'end'
  puts '>> ' + bot.response_to(input)
end

puts bot.farewell