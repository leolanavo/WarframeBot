R = ['Alloy Plate', 'Argon Crystal', 'Circuits', 'Control Module',
                 'Cryotic', 'Ferrite', 'Gallium', 'Morphics', 'Nano Spores',
                 'Neural Sensors', 'Neurodes', 'Orokin Cell', 'Oxium', 'Plastids',
                 'Polymer Bundle', 'Rubedo', 'Salvage', 'Tellurium',
                 'Nitain Extract', 'Synthula']

            i = 0
            kb = Array.new
            until i == R.size() do
                cell = [
                    create_inline_entry(R[i],'https://google.com'),
                    create_inline_entry(R[i+1], 'https://google.com')
                ]
                i += 2
                kb.push(cell)
            end

            markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
            bot.api.send_message(chat_id: msg.chat.id, text: "Filters", reply_markup: markup)

