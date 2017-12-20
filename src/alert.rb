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
        "Mission: "   + @mission.to_s + "\n" +
        "Planet: "    + @planet.to_s  + "\n" +
        "Credits: "   + @credits.to_s + "\n" +
        "Reward: "    + @reward.to_s  + "\n" +
        "Time Left: " + @r_time.to_s  + "\n\n"
    end
end
