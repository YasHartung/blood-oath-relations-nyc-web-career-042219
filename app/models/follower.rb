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

  def my_cults_slogans
    BloodOath.all.select do |bo|
      bo.follower == self
    end.map do |bo_follower|
      bo_follower.cult.slogan
    end
  end

  def self.most_active
    max_count = 0
    max_follower = nil
    self.all.each do |follower|
      cult_count = BloodOath.all.select do |bo|
        bo.follower == follower
      end.length

        if cult_count > max_count
          max_count = cult_count
          max_follower = follower
        end
    end
    max_follower
  end

  def self.top_ten
    self.all.sort_by do |follower|
      BloodOath.all.select do |bo|
        bo.follower == follower
      end.length
    end.last(10).reverse
  end
end
