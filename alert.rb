class Alert
    def initialize(mission, planet, credits, reward, time)
        @mission = mission
        @planet = planet
        @credits = credits
        @reward = reward
        @time = time
    end
end

class Invasion
    def initialize(mission, planet, f_faction, s_faction, f_reward, s_faction)
        @mission = mission
        @planet = planet
        @f_faction = f_faction
        @s_faction = s_faction
        @f_reward = f_reward
        @s_reward = s_reward
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
