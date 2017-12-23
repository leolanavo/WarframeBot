require 'telegram/bot'

require_relative 'twitter_wrapper.rb'
require_relative 'interactions.rb'
require_relative 'user.rb'

token = '501516696:AAEh8OJQ1xhTJ22dcWVK5zPjklvh1wXtt5U'

wrapper = TWrapper.new()
user = User.new

Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |msg|
        case msg.text.split(" ")[0]

        when '/start'
            user.change_id(msg.from.id)
            bot.api.send_message(chat_id: msg.chat.id, text: "Hello, #{msg.from.first_name}")

        when '/stop'
            bot.api.send_message(chat_id: msg.chat.id, text: "Bye, #{msg.from.first_name}")

        when '/add'
            filter = msg.text.split(" ")[1]
            user.add_filter(filter)
            bot.api.send_message(chat_id: msg.chat.id, text: "#{filter} added to the list")

        when '/remove'
            filter = msg.text.split(" ")[1]
            user.remove_filter(filter)
            bot.api.send_message(chat_id: msg.chat.id, text: "#{filter} remove to the list")

        when '/get'
            bot.api.send_message(chat_id: msg.chat.id, text: user.get_filters)

        when '/alerts'
            bot.api.send_message(chat_id: msg.chat.id, text: wrapper.get_alerts)

        when '/invasions'
            bot.api.send_message(chat_id: msg.chat.id, text: wrapper.get_invasions)

        when '/sortie'
            bot.api.send_message(chat_id: msg.chat.id, text: wrapper.get_sortie)

        when '/help'
            bot.api.send_message(chat_id: msg.chat.id, text: help)

        when '/test'
            markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: resource_menu())
            bot.api.send_message(chat_id: msg.chat.id, text: "Filters", reply_markup: markup)

        end
    end
end


