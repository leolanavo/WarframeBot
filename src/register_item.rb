require 'sqlite3'

ARRAY = [['Oxium', 'Nitain'], ['Cryotic']]
index = 0
db = SQLite3::Database.new "test.db"
db.execute "CREATE TABLE IF NOT EXISTS Users(Id INTEGER PRIMARY KEY, Name TEXT, Interval INTEGER,)"

ARRAY.each do |entry|
    if entry.length == 2 then
        db.execute "INSERT INTO Filters VALUES(#{index}, '#{entry[0]}')"
        db.execute "INSERT INTO Filters VALUES(#{index+1}, '#{entry[1]}')"
        index += 2
    else
        db.execute "INSERT INTO Filters VALUES(#{index}, '#{entry[0]}')"
        index += 1
    end
end

