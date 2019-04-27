class Cult

attr_reader :name, :founding_year
attr_accessor :location, :slogan

@@all = []

  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@all << self
  end

  def self.all
    @@all
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
end
