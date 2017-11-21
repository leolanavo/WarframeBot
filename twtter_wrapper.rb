require 'twitter'
load 'alert.rb'

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
            parser(tweet.text)
        end
    end

    def parser(tweet)
        puts "parsing: " + tweet
        tweet = tweet.split(":")
        head = tweet[0].split(" ")
        if head[0] == "Sortie" then
            parseSortie(tweet)
        elsif head[-1] == "Invasion" then
            parseInvasion(tweet)
        else
            parseAlert(tweet)
        end
    end

    def parseAlert(tweet)
        mission, planet = tweet[0].match(/(.*) \((.*)\)/i).captures
        time, credits, reward = tweet[1].match(/.* - ([0-9]*)m - ([0-9]*)cr(?: - (.*))?/i).captures

        puts mission + ', ' + planet
        puts time + ', ' + credits + (if reward == nil then '' else ', ' + reward end)
    end

    def parseSortie(tweet)
        enemy = tweet[0].match(/.* vs\. (.*)/i).captures[0]
        first = [0, 0]
        second = [0, 0]
        third = [0, 0]

        first[0], first[1], second[0], second[1], third[0], third[1] = 
            tweet[1].match(/ \[1\] (.*) - (.*) \[2\] (.*) - (.*) \[3\] (.*) - (.*)/i).captures
        puts "enemy: " + enemy 
        puts "first: " + first.to_s
        puts "second: " + second.to_s
        puts "third: " + third.to_s
    end

    def parseInvasion(tweet)
    end
end
