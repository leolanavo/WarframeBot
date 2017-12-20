require 'twitter'
require 'alert'
require 'invasion'
require 'sortie'
require 'interactions'

class TWrapper
    def initialize()
        @client = Twitter::REST::Client.new do |config|
            config.consumer_key        = "pCaeWkIwqnqtVdKSpcWB2EoPJ"
            config.consumer_secret     = "tN4nLwBFYlgyiYNKo5JAQ3FX0z7gtcn6nJ85U7aVO61ae6y613"
            config.access_token        = "1069161786-6NYf1HcZGxByOFZ9xofguBR9dVy1Ng1Gn1SXIx6"
            config.access_token_secret = "xD1wZM6YmaG5UlWODjuf7p9rSo2kyXmzHMTVKoCDkQlML"
        end

    end

    def get_alerts()
        alerts = "Active alerts\n\n"
        @client.user_timeline("WarframeAlerts", {count: 30}).each do |tweet|
            head = tweet.text.split(":")[0].split(" ")
            unless head[-1] == "Invasion" or head[0] == "Sortie" then
                alerts += parse_alert(tweet).to_s
            end
        end
        alerts
    end

    def get_invasions()
        invasions = "Active invasions\n\n"
        @client.user_timeline("WarframeAlerts", {count: 30}).each do |tweet|
            head = tweet.text.split(":")[0].split(" ")
            if head[-1] == "Invasion" then
                invasions += parse_invasion(tweet).to_s
            end
        end
        invasions
    end

    def get_sortie()
        sortie = "Active sortie\n\n"
        @client.user_timeline("WarframeAlerts", {count: 30}).each do |tweet|
            head = tweet.text.split(":")[0].split(" ")
            if head[0] == "Sortie" then
                sortie += parse_sortie(tweet).to_s
            end
        end
        sortie
    end

    def get_elapsed_time(tweet)
        (Time.new.utc - tweet.created_at).to_i/60
    end

    def parse_alert(tweet)
        mission, planet, time, credits, reward =
            tweet.text.match(/(.*) \((.*)\): .* - ([0-9]*)m - ([0-9]*)cr(?: - (.*))?/i).captures

        time = time.to_i - get_elapsed_time(tweet)
        return if time < 0

        new_alert = Alert.new(mission.to_s, planet.to_s, credits.to_s, reward.to_s, time, tweet.text)
        return new_alert
    end

    def parse_invasion(tweet)
        mission, planet, f_faction, f_reward, s_faction, s_reward =
            tweet.text.match(/(.*) \((.*)\) Invasion: (.*) (?: \((.*)\))?VS. (.*) \((.*)\)/i).captures
        newInvasion = Invasion.new(mission, planet, f_faction, s_faction, f_reward, s_reward, tweet)
        return newInvasion
    end

    def parse_sortie(tweet)
        first = [0, 0]
        second = [0, 0]
        third = [0, 0]

        enemy, first[0], first[1], second[0], second[1], third[0], third[1] =
            tweet.text.match(/.* vs\. (.*): \[1\] (.*) - (.*) \[2\] (.*) - (.*) \[3\] (.*) - (.*)/i).captures

        puts first
        puts second
        puts third

        new_sortie = Sortie.new(enemy, first, second, third, tweet)
        return new_sortie
    end
end

