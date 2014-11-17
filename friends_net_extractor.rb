require 'daybreak'
require 'csv'

filename = '/Users/avyatkin/Downloads/friends.txt'
sample_size = 20
friends_depth = 2

# 
db = Daybreak::DB.new('user_friends.db')

# CSV.foreach(filename, col_sep: ' ') do |line|
#   user_id = line.shift
#   db[user_id] = line
#   puts $. if $. % 1000 == 0
# end

puts "Db loaded"

user_ids = db.keys
user_nets = user_ids.each do |id|
  output = File.open("users/user_#{id}_net.csv", 'w')
  friends = db[id]
  users = friends + [id]
  users.each do |user_id|
    user_friends = db[user_id]
    output.puts(friends.map { |fr| "#{user_id} #{fr}" }.join("\n"))
  end
  puts $. if $. % 100 == 0
  output
end