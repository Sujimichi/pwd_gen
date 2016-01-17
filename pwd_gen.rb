# Password Generator
# Soviet Ketchup
# v1.1.0

length = 0
pwd = ""

until length > 5
  puts "How long do you want your password to be? (Greater than 5)"
  length = gets.chomp.to_i
  if length <= 5
    puts "That password is too short, please try again"
  end
end

until length == 0
  i = rand(33..126)
  c = i.chr
  pwd << c
  length -= 1
end

puts pwd
