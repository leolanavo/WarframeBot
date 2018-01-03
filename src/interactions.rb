def create_inline_entry(name, callback_value)
    Telegram::Bot::Types::InlineKeyboardButton.new(text: name, callback_data: callback_value)
end

def create_menu(array, cmd)
    puts array.last.length
    menu = array.map do |entry|
        unless array.last.length.odd? and entry == array.last then
            [
                create_inline_entry(entry[0], cmd + '_' + entry[0]),
                create_inline_entry(entry[1], cmd + '_' + entry[1])
            ]
        else
            [
                create_inline_entry(entry[0], cmd + '_' + entry[0])
            ]
        end
    end
    Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: menu)
end

def help()
    "/start \t Start the bot\n" +
    "/stop \t Stop the bot\n" +
    "/alerts \t Get the active alerts\n" +
    "/invasions \t Get the active invasions\n" +
    "/sortie \t Get the active sortie\n" +
    "/add \t Add a new filter\n" +
    "/remove \t Remove a filter\n" +
    "/get \t Get the active filters\n" +
    "/help \t Print this menu"
end
