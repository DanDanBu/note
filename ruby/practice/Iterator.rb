#Iterator for ruby, this can take place traditional loop method.

languages = ['Ruby', 'Javascript', 'Perl']
languages.each do |lang|
  puts "I love #{lang}!"
end

3.times do
  puts 'Good Job!'
end

3.times {puts 'gggg'}

1.upto(9) do |x|
	puts x
end

languages.each_with_index do |lang, i|
  puts "#{i+1}. I love #{lang}!"
end

languages.each_with_index do |lang, i| puts "#{i+1}. I love #{lang}!"  end

puts 
puts 

#other example of iterator

a = ["a", "b", "c", "d"]
b = a.map {|x| x + "!"}
puts b.inspect

b = [1, 2, 3].find_all{|x| x%2 == 0}
puts b.inspect

a = [51, 101, 216]
a.delete_if {|x| x <= 100}
puts a.inspect

arr = [7, 4, 5, 8, 3, 6, 9, 1, 2]
puts arr.sort!
puts arr.sort! {|a, b| b <=> a}

puts
puts 

puts (1..100).inject {|sum, n| sum + n}
puts (1..100).reduce(:+)
puts (6..11).reduce(2, :*)
puts (6..11).inject(2) {|production, n| production*n}

longest = %w{sheepcat sheep bear}.inject do |memo, word|
	memo.length > word.length ? memo : word
end
puts longest
