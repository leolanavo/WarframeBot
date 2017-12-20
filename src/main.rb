require 'telegram/bot'

require 'twitter_wrapper'
require 'interactions'
require 'user'

token = '501516696:AAEh8OJQ1xhTJ22dcWVK5zPjklvh1wXtt5U'

wrapper = TWrapper.new()
user = User.new

Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |message|
        case message.text.split(" ")[0]

        when '/start'
            user.change_id(message.from.id)
            bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}," +
                                 "please add your filters by typing /add <ITEM>")

        when '/stop'
            bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")

        when '/add'
            filter = message.text.split(" ")[1]
            user.add_filter(filter)
            bot.api.send_message(chat_id: message.chat.id, text: "#{filter} added to the list")

        when '/remove'
            filter = message.text.split(" ")[1]
            user.remove_filter(filter)
            bot.api.send_message(chat_id: message.chat.id, text: "#{filter} remove to the list")

        when '/get'
            bot.api.send_message(chat_id: message.chat.id, text: user.get_filters)

        when '/alerts'
            bot.api.send_message(chat_id: message.chat.id, text: wrapper.get_alerts)

        when '/invasions'
            bot.api.send_message(chat_id: message.chat.id, text: wrapper.get_invasions)

        when '/sortie'
            bot.api.send_message(chat_id: message.chat.id, text: wrapper.get_sortie)
        end
    end
end


