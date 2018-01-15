require 'telegram/bot'
require 'rufus-scheduler'

require_relative 'twitter_wrapper.rb'
require_relative 'interactions.rb'
require_relative 'user.rb'
require_relative 'arrays.rb'

token = '501516696:AAEh8OJQ1xhTJ22dcWVK5zPjklvh1wXtt5U'

wrapper = TWrapper.new()
user = nil
scheduler = Rufus::Scheduler.new
notify = false

Telegram::Bot::Client.run(token) do |bot|
    scheduler.every '10m' do
        unless user != nil and notify then
            bot.api.send_message(chat_id: user.get_id, text: wrapper.get_alerts)
        end
    end

    bot.listen do |msg|
        case msg
        when Telegram::Bot::Types::CallbackQuery
            cmd = msg.data.split("_")[0]
            case cmd
            when 'add'
                item = msg.data.split("_")[1]
                user.add_filter(item)
                bot.api.send_message(chat_id: msg.from.id, text: "#{item} added to the list")
            when 'remove'
                item = msg.data.split("_")[1]
                user.remove_filter(item)
                bot.api.send_message(chat_id: msg.from.id, text: "#{item} remove to the list")
            when 'dupe'
                msg_id = msg.message.message_id
                chat_id = msg.message.chat.id
                options = msg.data.split("_")
                menu = create_menu(options[1], options[2], options[3].to_i)
                bot.api.edit_message_text(chat_id: chat_id, message_id: msg_id,
                                          text: "Filters", reply_markup: menu)
            end

        when Telegram::Bot::Types::Message
            case msg.text.split(" ")[0]

            when '/start'
                user = User.new(msg.from.id, msg.from.first_name, '10m')
                bot.api.send_message(chat_id: msg.chat.id, text: "Hello, #{msg.from.first_name} " +
                                                                 "your user has been created")

            when '/stop'
                bot.api.send_message(chat_id: msg.chat.id, text: "Bye, #{msg.from.first_name}")

            when '/notify'
                notify = !notify
                bot.api.send_message(chat_id: user.get_id, text: wrapper.get_alerts)

            when '/add'
                menu = create_menu('add', 'resources', 0)
                bot.api.send_message(chat_id: msg.chat.id, text: "Filters", reply_markup: menu)

            when '/remove'
                bot.api.send_message(chat_id: msg.chat.id, text: "Filters")

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

            end
        end
    end
    scheduler.join
end


