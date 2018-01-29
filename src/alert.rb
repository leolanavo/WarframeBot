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
        str = "Mission: "   + @mission.to_s + "\n" +
        "Planet: "    + @planet.to_s  + "\n" +
        "Credits: "   + @credits.to_s + "\n"

        if @reward.empty?
            str += "Reward: "    + @reward.to_s  + "\n"
        end

        str += "Time Left: " + @r_time.to_s  + "\n\n"
        str
    end
end
