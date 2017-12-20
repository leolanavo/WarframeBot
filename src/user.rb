class User
    def initialize()
        @id = -1
        @filters = Array.new
    end

    def to_s()
        "ID: " + @id.to_s + "\n" +
        "Filters: " + @filters[0] + " " + @filters[1] + "\n"
    end

    def change_id(id)
        @id = id
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
