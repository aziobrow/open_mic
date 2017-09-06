require_relative 'joke'
require 'csv'

class User
  attr_reader :name, :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(other_user, joke)
    other_user.learn(joke).uniq
  end

  def perform_routine_for(other_user)
    @jokes.map {|joke| other_user.learn(joke)}
  end

  def learn_routine(csv)
    jokes = File.new('./jokes.txt', 'w+')
    csv = CSV.read('./jokes.csv')
    csv.each do |joke|
      jokes.write(joke + "\n")
    end
    jokes.each_line do |new_joke|
      user.learn(new_joke)
    end
  end
end
