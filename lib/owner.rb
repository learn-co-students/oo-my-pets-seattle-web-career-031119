require 'pry'

class Owner

  @@all = []

  attr_reader :species

  attr_accessor :name, :pets

  def initialize(species)
    @species = species
    @@all << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.count
    @@all.count
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    pets[:fishes] << new_fish
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    pets[:cats] << new_cat
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    pets[:dogs] << new_dog
  end

  def walk_dogs
    self.pets[:dogs].map {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats].map {|cat| cat.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].map {|fish| fish.mood = "happy"}
  end

  def sell_pets
    self.pets.values.each do |category|
      #binding.pry
      category.map {|pet| pet.mood= "nervous"}
    end
    self.pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def list_pets
    pet_count = {"Fish" => 0, "Cat" => 0, "Dog" => 0}
    self.pets.values.each do |category|
      #binding.pry
      category.each do |pet|
        pet_count[pet.class.to_s] += 1
      end
    end
    "I have #{pet_count["Fish"]} fish, #{pet_count["Dog"]} dog(s), and #{pet_count["Cat"]} cat(s)."
  end

  # def lye_bath(pet)
  #   pet.mood = "very sad"
  #   pet.bones = "dissolved"
  #   self.soap = "good"
  # end (of pets)
end
