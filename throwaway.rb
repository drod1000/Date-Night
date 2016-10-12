require 'pry'


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
  
=begin
split_file_array.pop
p split_file_array
split_file.each do |line|
  line.each do |second_line|
    puts second_line
  end
end
=end
p int_score
p clean_titles
