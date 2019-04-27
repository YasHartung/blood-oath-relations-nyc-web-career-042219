require ('pry')

class Cult

attr_reader :name, :founding_year
attr_accessor :location, :slogan, :min_age

@@all = []

  def initialize(name, location, founding_year, slogan, min_age)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @min_age = min_age
    @@all << self
  end

  def self.all
    @@all
  end


  def recruit_follower (follower)
    
    if follower.age >= self.min_age
      BloodOath(follower, self, Date.today.to_s)
    else
      return "Too young to join."
    end
  end

  def cult_population
    BloodOath.all.select do |bo|
      bo.cult == self
    end.length
  end


  def self.find_by_name (name)
    @@all.find do |cult|
      cult.name == name
    end
  end

  def self.find_by_location (location)
    @@all.select do |cult|
      cult.location == location
    end
  end

  def self.find_by_founding_year (founding_year)
    @@all.select do |cult|
      cult.founding_year == founding_year
    end
  end

  def average_age
    sum = 0
    length =BloodOath.all.select do |bo|
      bo.cult == self
    end.each do |bo_cult|
      sum += bo_cult.follower.age
    end.length
    sum.to_f / length
  end

  def my_followers_mottos
    BloodOath.all.select do |bo|
      bo.cult == self
    end.map do |bo_cult|
      bo_cult.follower.life_motto
    end
  end

  def self.least_popular
    self.all.sort_by do |cult|
      cult.cult_population
    end.first
  end

  def self.most_common_location
    max_count = 0
    max_location = ""
    locations = self.all.map do |cult|
      cult.location
    end.uniq

    locations.each do |location|
      binding.pry
      if  self.find_by_location(location).length > max_count
        max_count = self.find_by_location(location).length
        max_location = location
      end
    end
    max_location
  end


end
