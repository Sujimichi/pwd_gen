# Password Generator
# Soviet Ketchup
# v1.2.0

# Defining variables and constants
LETTERS = (65..90).to_a + (97..122).to_a
NUMBERS = (48..57).to_a
CHARS   = (33..47).to_a + (58..64).to_a + (91..96).to_a + (123..126).to_a
length = 0
pwd = ""
inc = ""
characters = []

# Get the length of the password
until length > 5
  puts "How long do you want your password to be? (Greater than 5)"
  length = gets.chomp.to_i
  if length <= 5
    puts "That password is too short, please try again"
  end
end

puts "\nPlease answer this with a combination of three 'y's or 'n's."
puts "Do you want: "
puts " -Letters in your password?            [y/n]"
puts " -Numbers in your password?            [y/n]"
puts " -Special Characters in your password? [y/n]"

# Get whether to include letters, numbers and special characters in the password
until inc == "nny" or inc == "nyn" or inc == "nyy" or inc == "ynn" or inc == "yny" or inc == "yyn" or inc == "yyy"
  inc = gets.chomp
end

# Add selected characters to the pwd_gen selection
if inc[0] == "y"
  characters += LETTERS
end
if inc[1] == "y"
  characters += NUMBERS
end
if inc[2] == "y"
  characters += CHARS
end

# Generate each character of the password
until length == 0
  i = characters.sample
  c = i.chr
  pwd << c
  length -= 1
end

puts pwd
