
require 'telegram/bot'

def show_params
  puts "[INFO] Params:"
  puts "* TOKEN        = #{TOKEN}"
  puts "* BOT_USERNAME = #{BOT_USERNAME}"
  puts "[INFO] Running bot #{$0}..."
end
show_params
Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    puts " => #{message.text}"
    case message.text
    when get('/hello')
      bot.api.send_message(chat_id: message.chat.id, text: "Hello @{user.first_name)!")
    when get('/hello', BOT_USERNAME)
      bot.api.send_message(chat_id: message.chat.id, text: "user.first_name)!")
    when get('/bye')
      bot.api.send_message(chat_id: message.chat.id, text: "Bye bye!")
      exit
    end
  end
end
