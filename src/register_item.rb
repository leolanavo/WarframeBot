require 'sqlite3'

require_relative 'arrays.rb'

index = 0
db = SQLite3::Database.new "database/database.db"
db.execute "CREATE TABLE IF NOT EXISTS Items
            (Id INTEGER PRIMARY KEY, Name VARCHAR(50),
             UNIQUE(Id))"

SUPER.each do |cell|
    array = cell[1]
    array.each do |entry|
        if entry.length == 2 then
            puts "#{entry[0]}, #{entry[1]}\n"
            db.execute "INSERT OR IGNORE INTO Items VALUES(#{index}, '#{entry[0]}')"
            db.execute "INSERT OR IGNORE INTO Items VALUES(#{index+1}, '#{entry[1]}')"
            index += 2
        else
            puts "#{entry[0]}\n"
            db.execute "INSERT OR IGNORE INTO Items VALUES(#{index}, '#{entry[0]}')"
            index += 1
        end
    end
end
