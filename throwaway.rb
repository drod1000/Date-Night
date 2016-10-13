require 'pry'
scores = []
titles = []

file = File.new('movies.txt', 'r')
    split_file = file.map do |line|
      line.split(',', 2)
    end
split_file_array = split_file.to_a
split_file_array.pop
scores = split_file_array.collect do |index|
  index[0]
end
titles = split_file_array.collect do |index|
  index[1]
end
int_score = scores.map do |number|
  number.to_i
end
clean_titles = titles.map do |title|
  title.chomp
end

binding.pry
