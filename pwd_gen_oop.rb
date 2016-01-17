# Password Generator (OOP)
# Soviet Ketchup
# v0.0.0

LETTERS = (65..90).to_a + (97..122).to_a
NUMBERS = (48..57).to_a
CHARS   = (33..47).to_a + (58..64).to_a + (91..96).to_a + (123..126).to_a

# Password class
class Password

  # Set the password's length
  def initialize l = 16, c = "yyy"
    @length = l
    @chars = c
    selection = [] #selection needs to be defined before you can call += on it later

    if @chars[0] == "y"
      selection += LETTERS
    end
    if @chars[1] == "y"
      selection += NUMBERS
    end
    if @chars[2] == "y"
      selection += CHARS
    end

    self.generate
  end

  # Generate the password based off what characters to include
  protected
  def generate
    puts "#{@length} || #{@chars}"  # <-- temporary ofc
  end
end

p = Password.new
puts p
