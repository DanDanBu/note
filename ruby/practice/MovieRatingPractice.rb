movies = {
    HarryPotter: 4,
    TheLoadOfRings: 3,
    RushHour: 4,
    Blended: 4,
    LegalHigh: 5
}

puts "Type the function you want :"
choice = gets.chomp

case choice
when "add"
    puts "which movie do you want to add?"
    title = gets.chomp
    if movies[title.to_sym].nil?
        puts "How is the rate?(1-5)"
        rating = gets.chomp
        movies[title.to_sym] = rating.to_i
    else
        puts "This movie is already exist in our list!"
    end
when "update"
    puts "which movie rating do you want to update?"
    title = gets.chomp
    if movies[title.to_sym].nil?
        puts "This movie is not in the list!"
    else
        puts "What is your new rating for #{title}?"
        rating = gets.chomp
        movies[title.to_sym] = rating.to_i
    end
when "display"
    movies.each { |movie, rating| puts "#{movie}: #{rating}"}
when "delete"
    puts "which movie do you want to delete?"
    title = gets.chomp
    if movies[title.to_sym].nil?
        puts "this movie is not in list!"
    else
        movies.delete(title.to_sym)
    end
    movies.each { |movie, rating| puts "#{movie}: #{rating}"}
else
    puts "Error!"
end
