require 'telegram/bot'

token = '501516696:AAEh8OJQ1xhTJ22dcWVK5zPjklvh1wXtt5U'

Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |message|
        case message.text
        when '/start'
            bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
        when '/stop'
            bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
        when '/filter'
            bot.api.send_message(chat_id: message.chat.id, text: "Filter, #{message.from.fist_name}")
        when '/alerts'
            bot.api.send_message(chat_id: message.chat.id, text: "Alerts, #{message.from.fist_name}")
        when '/invasions'
            bot.api.send_message(chat_id: message.chat.id, text: "Invasions, #{message.from.fist_name}")
        when '/sortie'
            bot.api.send_message(chat_id: message.chat.id, text: "Sortie, #{message.from.fist_name}")
        end
    end
end
