load 'twitter_wrapper.rb'

def filter(filter, tw_wrapper)
    alerts = tw_wrapper.getAlerts()
end

def renderMessage(mission)
    case mission.class
    when Alert
        message = "Alert\n" +
            "Mission: " + mission.mission + "\n" +
            "Planet: " + mission.planet + "\n" +
            "Credits: " + mission.credits + "\n" +
            "Reward: " + mission.reward + "\n" +
            "Time Left: " + mission.r_time
    when Invasion
        message = "Invasion\n" +
            "Mission: " + mission.mission + "\n" +
            "Planet: " + mission.planet + "\n" +
            "Credits: " + mission.credits + "\n" +
            "Fisrt Faction: " + mission.f_faction + "\n" +
            "Second Faction: " + mission.s_faction + "\n" +
            f_faction + " Reward: " + mission.f_reward + "\n" +
            s_faction + " Reward: " + mission.s_reward + "\n"
    when Sortie
        message = "Sortie\n" +
            "NOT IMPLMEMENTED\n"
    end
end

