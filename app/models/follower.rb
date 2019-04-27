require ('date')

class Follower

attr_reader :name, :age
attr_accessor :life_motto

@@all=[]

  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def self.all
    @@all
  end

  def cults
    BloodOath.all.select do |bo|
      bo.follower == self
    end
  end

  def join_cult (cult)
    BloodOath.new(self, cult, Date.today.to_s)
  end

  def self.of_a_certain_age(age)
    self.all.select do |follower|
      follower.age >= age
    end
  end
end
