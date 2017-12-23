RESOURCES = ['Alloy Plate', 'Argon Crystal', 'Circuits', 'Control Module',
             'Cryotic', 'Ferrite', 'Gallium', 'Morphics', 'Nano Spores',
             'Neural Sensors', 'Neurodes', 'Orokin Cell', 'Oxium', 'Plastids',
             'Polymer Bundle', 'Rubedo', 'Salvage', 'Tellurium',
             'Nitain Extract', 'Synthula']

def create_inline_entry(name, callback_value)
    Telegram::Bot::Types::InlineKeyboardButton.new(text: name, url: callback_value)
end

def resource_menu()
    kb = Array.new
    i = 0
    until i > RESOURCES.size do
        kb.push([create_inline_entry(RESOURCES[i], 'https://google.com'), create_inline_entry(RESOURCES[i+1], 'https://google.com')])
        i += 2
    end
    return kb
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
