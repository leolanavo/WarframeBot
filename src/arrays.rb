MENU = [['Auras', 'Endo'], ['Helmets', 'Items'],
        ['Nightmares', 'Resources'], ['Skins', 'Vauban'],
        ['Weapons']]

RESOURCES = [['Alloy Plate', 'Argon Crystal'], ['Circuits', 'Control Module'],
             ['Cryotic', 'Ferrite'], ['Gallium', 'Morphics'],
             ['Nano Spores', 'Neural Sensors'], ['Neurodes', 'Orokin Cell'],
             ['Oxium', 'Plastids'], ['Polymer Bundle', 'Rubedo'],
             ['Salvage', 'Tellurium'], ['Nitain Extract']]

ITEMS = [['Kubrow Egg', 'Kavat Genetic Code'], ['Void Traces', 'Synthula'],
         ['Orokin Catalyst', 'Orokin Reactor'], ['Void Traces', 'Forma']]

VAUBAN = [['Chasis', 'Neuroptics'], ['Systems']]

ENDO = [['80', '100'], ['150']]

WEAPONS = [['Ceramic Dagger', 'Dark Dagger'], ['Dark Sword', 'Glaive'],
           ['Heat Dagger', 'Heat Sword'], ['Jaw Sword', 'Pagolin Sword'],
           ['Plasma Sword']]

HELMETS = [['Ash', 'Atlas'], ['Banshee', 'Chroma'], ['Ember', 'Equinox'],
           ['Excalibur', 'Frost'], ['Gara', 'Harrow'], ['Hydroid', 'Inaros'],
           ['Ivara', 'Limbo'], ['Loki', 'Mag'], ['Mesa', 'Mirage'],
           ['Nekros', 'Nezha'], ['Nidus', 'Nova'], ['Nyx', 'Oberon'],
           ['Octavia', 'Rhino'], ['Saryn', 'Titania'], ['Trinity', 'Valkyr'],
           ['Vauban', 'Volt'], ['Wukong', 'Zephyr']]

AURAS = [['Brief Respite', 'Corrosive Projection'], ['Dead Eye', 'EMP Aura'],
         ['Empowered Blades', 'Enemy Radar'], ['Energy Siphon', 'Growing Power'],
         ['Infested Impedance', 'Loot Detector'], ['Physique', 'Pistol Amp'],
         ['Pistol Scavenger', 'Rejuvenation'], ['Rifle Amp', 'Rifle Scavenger'],
         ['Shield Disruption', 'Shotgun Amp'], ['Shotgun Scavenger', 'Sniper Scavenger'],
         ['Speed Holster', 'Sprint Boost'], ['Stand United', 'Steel Charge'],
         ['Toxin Resistance']]

NIGHTMARES = [['Accelerated Blast', 'Animal Instict'], ['Armored Agility', 'Blaze'],
              ['Chilling Reload', 'Constitution'], ['Drifting Contact', 'Focus Energy'],
              ['Fortitude', 'Hammer Shot'], ['Ice Storm', 'Lethal Torrent'],
              ['Rending Strike', 'Seeking Fury'], ['Shred', 'Streamlined Form'],
              ['Stunning Speed', 'Vigor'], ['Wildfire']]

SKINS = [['Brook', 'Dagger Axe'], ['Manticore']]

SUPER = [['main', MENU], ['Resources', RESOURCES], ['Items', ITEMS],
         ['Vauban', VAUBAN], ['Endo', ENDO], ['Weapons', WEAPONS],
         ['Helmets', HELMETS], ['Auras', AURAS], ['Nightmares', NIGHTMARES],
         ['Skins', SKINS]]

def get_array(name)
    SUPER.each do |entry|
        if entry[0] == name then
            return entry[1]
        end
    end
end

