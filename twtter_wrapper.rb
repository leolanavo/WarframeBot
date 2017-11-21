class Twitts
    def initialize()
        @client = Twitter::REST::Client.new do |config|
            config.consumer_key        = "pCaeWkIwqnqtVdKSpcWB2EoPJ"
            config.consumer_secret     = "tN4nLwBFYlgyiYNKo5JAQ3FX0z7gtcn6nJ85U7aVO61ae6y613"
            config.access_token        = "1069161786-6NYf1HcZGxByOFZ9xofguBR9dVy1Ng1Gn1SXIx6"
            config.access_token_secret = "xD1wZM6YmaG5UlWODjuf7p9rSo2kyXmzHMTVKoCDkQlML"
        end
    end
end
