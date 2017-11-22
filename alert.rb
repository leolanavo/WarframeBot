class Alert
    def initialize(mission, planet, credits, reward, time, text)
        @mission = mission
        @planet = planet
        @credits = credits
        @reward = reward
        @r_time = time
        @tweet = text
    end

    attr_reader :mission, :planet, :credits, :reward, :r_time, :text

    def filter(text)
        /text/.match(@tweet)
    end
end

class Invasion
    def initialize(mission, planet, f_faction, s_faction, f_reward, s_reward, text)
        @mission = mission
        @planet = planet
        @f_faction = f_faction
        @s_faction = s_faction
        @f_reward = f_reward
        @s_reward = s_reward
        @tweet = text
    end

    def filter(text)
        /text/.match(@tweet)
    end
end

class Sortie
    def initialize(enemy, first, second, third, text)
        @enemy = enemy
        @first = first
        @second = second
        @third = third
        @tweet = text
    end

    def filter(text)
        /text/.match(@tweet)
    end

    attr_reader :enemy
end
