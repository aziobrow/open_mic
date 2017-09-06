require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class JokeTest < Minitest::Test

  def test_it_exists_and_initializes_with_id_and_question_and_answer
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    assert_equal 1, joke.id
    assert_equal "Why did the strawberry cross the road?", joke.question
    assert_equal "Because his mother was in a jam.", joke.answer
  end

end
