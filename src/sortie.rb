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
        "Enemy: "           + @enemy.to_s   + "\n" +
        "Fisrt Misssion: "  + @first[0].to_s  + "\n" +
        "Modifier: "        + @first[1].to_s  + "\n\n" +
        "Second Misssion: " + @second[0].to_s + "\n" +
        "Modifier: "        + @second[1].to_s + "\n\n" +
        "Third Misssion: "  + @third[0].to_s  + "\n" +
        "Modifier: "        + @third[1].to_s  + "\n"
    end
end
