# EPD is short for entries per display
EPD = 4

def create_inline_entry(name, callback_value)
    Telegram::Bot::Types::InlineKeyboardButton.new(text: name, callback_data: callback_value)
end

def create_menu(cmd, type, start)
    array = get_array(type)
    finish = start + EPD >= array.length ? array.length - 1 : start + EPD

    menu = array.values_at(start..finish).map do |entry|
        unless array.last.length.odd? and entry == array.last then
            [
                create_inline_entry(entry[0], "#{cmd}_#{entry[0]}"),
                create_inline_entry(entry[1], "#{cmd}_#{entry[1]}")
            ]
        else
            [
                create_inline_entry(entry[0], "#{cmd}_#{entry[0]}")
            ]
        end
    end

    if start + 4 < array.length and start - 4 >= 0 then
        menu.push(
            [
                create_inline_entry('Next', "dupe_#{cmd}_#{type}_#{start + 4}"),
                create_inline_entry('Back', "dupe_#{cmd}_#{type}_#{start - 4}")
            ]
        )

    elsif start + 4 < array.length then
        menu.push([create_inline_entry('Next', "dupe_#{cmd}_#{type}_#{start + 4}")])

    elsif start - 4 >= 0 then
        menu.push([create_inline_entry('Back', "dupe_#{cmd}_#{type}_#{start - 4}")])
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
