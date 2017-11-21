class Alert
    def initialize(mission, planet, credits, reward, time, type)
        @mission = mission
        @planet = planet
        @credits = credits
        @reward = reward
        @time = time
        @type = type
    end
end

class Invasion
    def initialize(mission, planet, faction, reward)
        @mission = mission
        @planet = planet
        @faction = faction
        @reward = reward
    end
end

class Sortie
    def initialize(enemy, first, second, third)
        @enemy = enemy
        @first = first
        @second = second
        @third = third
    end
    attr_reader :enemy
end
