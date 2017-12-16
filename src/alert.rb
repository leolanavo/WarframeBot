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

    def to_s()
        "Alert\n" +
            "Mission: "   + @mission.to_s + "\n" +
            "Planet: "    + @planet.to_s  + "\n" +
            "Credits: "   + @credits.to_s + "\n" +
            "Reward: "    + @reward.to_s  + "\n" +
            "Time Left: " + @r_time.to_s
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

    def to_s()
        "Invasion\n" +
            "Mission: "              + @mission.to_s   + "\n" +
            "Planet: "               + @planet.to_s    + "\n" +
            "Fisrt Faction: "        + @f_faction.to_s + "\n" +
            "Second Faction: "       + @s_faction.to_s + "\n" +
            @f_faction.to_s + " Reward: " + @f_reward.to_s  + "\n" +
            @s_faction.to_s + " Reward: " + @s_reward.to_s  + "\n"
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

    attr_reader :enemy

    def filter(text)
        /text/.match(@tweet)
    end

    def to_s()
        "Sortie\n" +
            "Enemy: "                + @mission.to_s   + "\n" +
            "Fisrt Misssion: "       + @first[0].to_s  + "\n" +
            "Modifier: "             + @first[1].to_s  + "\n" +
            "Second Misssion: "      + @second[0].to_s + "\n" +
            "Modifier: "             + @second[1].to_s + "\n" +
            "Third Misssion: "       + @Third[0].to_s  + "\n" +
            "Modifier: "             + @Third[1].to_s  + "\n" +
            @f_faction.to_s + " Reward: " + @f_reward.to_s  + "\n" +
            @s_faction.to_s + " Reward: " + @s_reward.to_s  + "\n"
    end
end
