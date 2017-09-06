require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_it_starts_with_no_jokes
    sal = User.new('Sal')

    assert_equal [], sal.jokes
  end

  def test_learn_a_joke_returns_array_of_joke_objects
    sal = User.new('Sal')
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    sal.learn(joke)

    assert_instance_of Joke, sal.jokes[0]
  end

  def test_user_can_tell_joke_to_another_user
    sal = User.new('Sal')
    ali = User.new('Ali')
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    sal.learn(joke)

    sal.tell(ali, joke)

    assert_equal [joke], sal.tell(ali, joke)
  end

  def test_user_can_learn_multiple_jokes
    sal = User.new('Sal')
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})

    sal.learn(joke_1)
    sal.learn(joke_2)

    assert_equal [joke_1, joke_2], sal.jokes
  end

  def test_performing_routine_transfers_all_jokes_to_other_user
    sal = User.new('Sal')
    ali = User.new('Ali')
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})

    sal.learn(joke_1)
    sal.learn(joke_2)

    sal.perform_routine_for(ali)

    assert_equal [joke_1, joke_2], ali.jokes
    assert_equal 2, ali.jokes.count
  end

  def test_learn_routine_populates_jokes_from_csv
    casey = User.new("Casey")
    casey.learn_routine('./jokes.csv')

    assert_equal 100, casey.jokes.count
  end


end
