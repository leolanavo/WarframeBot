N_BITS = ([42].pack('i').size * 8)
MAX = 2 ** (N_BITS - 2) - 1

class User
    def initialize(id, name, time)
        @id = id
        @name = name
        @time = time
        @filters = Array.new
        @credits = MAX

        db = SQLite3::Database.new "database/database.db"
        db.execute "CREATE TABLE IF NOT EXISTS Users
                    (Id INTEGER PRIMARY KEY, Name TEXT,
                    Time TEXT, Credits INTEGER,
                    UNIQUE (Id))"

        db.execute "INSERT OR IGNORE INTO Users VALUES (#{@id}, '#{@name}', '#{@time}', #{@credits})"
    end

    def to_s()
        "Name: #{@name}\n" +
        "ID: #{@id.to_s}\n" +
        "Time: #{@time}\n"
    end

    def get_id()
        @id
    end

    def set_time(time)
        @time = time + "m"
    end

    # The capture group cuts the uncessary parenthesis content used for the
    # reward
    def filter(reward)
        @filters.include?(reward.match(/(.*) \(.*\)/i).captures)
    end

    def set_credits(amount)
        @credits = amount
    end

    def get_filters()
        str = "Filters: \n\t"
        @filters.each do |filter|
            str += filter.to_s + "\n\t"
        end
        str
    end

    def add_filter(filter)
        if !(@filters.include?(filter)) then
            @filters.push(filter)
        end
    end

    def remove_filter(filter)
        if @filters.include?(filter) then
            @filters.delete(filter)
        end
    end
end
