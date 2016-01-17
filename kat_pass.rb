class KatPass
  attr_accessor :args

  def initialize args = {} #args given as a hash of options - lets you give args in any order and can take additional args without changing things here.
    @args = {:length => 16, :letters => true, :numbers => true, :special => true}.merge(args)   #replace any matching keys from default values with the ones given
  end

  def make    
    @pallet = [] #mnake or re-make pallet on each run so args can be changed between calls
    @pallet << [('a'..'z'), ('A'..'Z')].map{|r| r.to_a}.flatten if @args[:letters]  #add letters
    @pallet << (0..9).to_a  if @args[:numbers]                                      #add numbers
    @pallet << [(33..47), (58..64), (91..96), (123..126)].map{|r| r.to_a}.flatten.map{|i| i.chr} if @args[:special] #add squiggly things
    @pallet = @pallet.flatten! #flatten nested arrays into single array    
    self.generate! 
  end

  protected

  #the actual contructor method. needs to be called from .make to ensure @pallet is ready
  def generate!
    puts @args.map{|k,v| "#{k} -> #{v}"} #show settings
    pwd = @pallet.sample(@args[:length]).join #<- The actual generation of the password. NO DANGEROUS UNTIL LOOPS HERE!!
    pwd.downcase! if @args[:lowercase] #extra thing, NOTE this arg isn't specially handled in init but you can pass it in anyway.
    pwd #return the assword
  end

end

k = KatPass.new :special => false , :length => 42 #call with or without args and in whatever order
p = k.make
puts p

#change length and make another password
k.args[:length] = 6 
p2 = k.make
puts p2

k.args.merge!(:length => 10, :special => true)
p3 = k.make
puts p3
