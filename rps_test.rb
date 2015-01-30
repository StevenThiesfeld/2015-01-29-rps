require_relative 'rps_player'
require_relative 'rps_game'
require 'minitest/autorun'

class Test_Player <Minitest::Test
  
  def test_setters
    player1 = Player.new("test")
    assert_equal("test", player1.name)#
    player1.score = 5
    assert_equal(5, player1.score)#should pass
  end
  
  def test_win
    player1 = Player.new("test")
    player1.win
    assert_equal(1, player1.score)
    player1.win
    assert_equal(2, player1.score)
  end
end#classend

class Test_Game <Minitest::Test
  
  def test_get_move(player)
    player1 = Person.new("test")
    player2 = Person.new("test2")
    testgame = Game.new(player1, player2, 3)
    testgame.get_move(player1)
    assert_kind_of(String, player1.move)
    assert_includes(testgame.valid_move, player1.move)
  end
end