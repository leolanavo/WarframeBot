class User
    def initialize(id, name, time)
        @id = id
        @name = name
        @time = time
        @filters = Array.new
        @credits = Float::INFINITY
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
