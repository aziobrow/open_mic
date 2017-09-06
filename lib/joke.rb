class Joke

  attr_reader :id, :question, :answer
  def initialize(joke = {})
    joke.each { |key,value| instance_variable_set("@#{key}", value) }
  end

end
