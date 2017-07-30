require './lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_exists
    game = Scrabble.new
    assert_instance_of Scrabble, game
  end

  def test_it_can_return_score_for_word
    game = Scrabble.new
    assert_equal 8, game.score("hello")
  end

  def test_it_can_return_0_for_empty_strings
    game = Scrabble.new
    assert_equal 0, game.score("")
  end

  def test_it_can_return_0_for_nil
    game = Scrabble.new
    assert_equal 0, game.score(nil)
  end

end
