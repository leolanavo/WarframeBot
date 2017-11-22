require 'twitter'
load 'alert.rb'
load 'interactions.rb'

class TWrapper
    def initialize()
        @client = Twitter::REST::Client.new do |config|
            config.consumer_key        = "pCaeWkIwqnqtVdKSpcWB2EoPJ"
            config.consumer_secret     = "tN4nLwBFYlgyiYNKo5JAQ3FX0z7gtcn6nJ85U7aVO61ae6y613"
            config.access_token        = "1069161786-6NYf1HcZGxByOFZ9xofguBR9dVy1Ng1Gn1SXIx6"
            config.access_token_secret = "xD1wZM6YmaG5UlWODjuf7p9rSo2kyXmzHMTVKoCDkQlML"
        end

    end

    def getAlerts()
        puts "getAlerts"
        @client.user_timeline("WarframeAlerts", {count: 30}).each do |tweet|
            @alerts.insert(parse(tweet))
        end
    end

    def getElapsedTime(tweet)
        (Time.new.utc - tweet.created_at).to_i/60
    end

    def parse(tweet)
        head = tweet.text.split(":")[0].split(" ")
        if head[0] == "Sortie" then
            parseSortie(tweet)
        elsif head[-1] == "Invasion" then
            parseInvasion(tweet)
        else
            parseAlert(tweet)
        end
    end

    def parseAlert(tweet)
        mission, planet, time, credits, reward =
            tweet.text.match(/(.*) \((.*)\): .* - ([0-9]*)m - ([0-9]*)cr(?: - (.*))?/i).captures

        time = time.to_i - getElapsedTime(tweet)
        return if time < 0

        newAlert = Alert.new(mission.to_s, planet.to_s, credits.to_s, reward.to_s, time, tweet.text)
        puts newAlert.to_s
        return newAlert
    end

    def parseInvasion(tweet)
        mission, planet, f_faction, f_reward, s_faction, s_reward =
            tweet.text.match(/(.*) \((.*)\) Invasion: (.*) (?: \((.*)\))?VS. (.*) \((.*)\)/i).captures
        newInvasion = Invasion.new(mission, planet, f_faction, s_faction, f_reward, s_reward, tweet)
        puts newInvasion.to_s
        return newInvasion
    end

    def parseSortie(tweet)
        first = [0, 0]
        second = [0, 0]
        third = [0, 0]

        enemy, first[0], first[1], second[0], second[1], third[0], third[1] =
            tweet.text.match(/.* vs\. (.*): \[1\] (.*) - (.*) \[2\] (.*) - (.*) \[3\] (.*) - (.*)/i).captures

        puts "Enemy: " + enemy.to_s
        puts "First Mission: " + first[0].to_s + "Modifier: " + first[1].to_s
        puts "Second Mission: " + second[0].to_s + "Modifier: " + second[1].to_s
        puts "Third Mission: " + third[0].to_s + "Modifier: " + third[1].to_s
        puts
    end
end

