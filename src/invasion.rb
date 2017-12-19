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
        "Mission: "                   + @mission.to_s   + "\n" +
        "Planet: "                    + @planet.to_s    + "\n" +
        "Fisrt Faction: "             + @f_faction.to_s + "\n" +
        "Second Faction: "            + @s_faction.to_s + "\n" +
        @f_faction.to_s + " Reward: " + @f_reward.to_s  + "\n" +
        @s_faction.to_s + " Reward: " + @s_reward.to_s  + "\n\n"
    end
end
