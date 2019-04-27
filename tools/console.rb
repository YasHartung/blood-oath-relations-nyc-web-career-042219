require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

satan = Cult.new("Satan Worshiper", "Mordor", 1730 , "There can only be one ring")
elves = Cult.new("The Light", "Rivendale" , 1709, "Humans are weak but we must prevail")
other_elves = Cult.new("The Forest", "Rivendale" , 1715, "We are witch elves")

smeagul = Follower.new("Smeagul", 27, "Be kind to everyone")
gollum = Follower.new("Gollum", 27, "Precious")
orlando = Follower.new("Orlando", 117, "Beat the Dwarf")

smeagul_good = BloodOath.new(smeagul, elves, "1715-09-03")
gollum_bad = BloodOath.new(gollum, satan,"1732-10-16")
orlando_elf = BloodOath.new(orlando, other_elves, "1635-01-25")

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
