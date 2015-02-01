# require_relative 'rps_player'
# require_relative 'rps_game'
# require_relative 'rps_rules'
require_relative 'rps_driver'
require 'minitest/autorun'

class Test_Rules <Minitest::Test
  
  def test_rps
    rules = Rules.new
    assert_equal(rules.rps, ["rock", "paper", "scissors"])
    
  end
  
  def test_rps_judge_game
    rules = Rules.new
    player1 = Player.new("test")
    player2 = Player.new("test2")
    player1.move = "rock"
    player2.move = "paper"
    assert_equal(player2, rules.rps_judge_game(player1, player2))
    player1.move = "rock"
    player2.move = "rock"
    assert_equal(nil, rules.rps_judge_game(player1, player2))
  end
end#classend
    

class Test_Player <Minitest::Test
  
  def test_attributes
    player1 = Player.new("test")
    assert_equal("test", player1.name)#
    player1.score = 5 #should return error, means score can't be cheated
    assert_equal(5, player1.score)#should pass
  end
  
  def test_win
    player1 = Player.new("test")
    player1.win
    assert_equal(1, player1.score)
    player1.win
    assert_equal(2, player1.score)
  end
  
  def test_rps_move
    rules = Rules.new
    player1 = Player.new("test")
    player2 = Player.new("test2")
  end
    
  
end#classend

class Test_Game <Minitest::Test
  def test_scoreboard
    rules = Rules.new
    player1 = Player.new("test")
    player2 = Player.new("test2")
    game = Game.new(player1, player2, 3)
    game.scoreboard(player1)
    assert_equal(1, player1.score)
  end
  
  def test_end_game
    rules = Rules.new
    player1 = Player.new("test")
    player2 = Player.new("test2")
    game = Game.new(player1, player2, 3)
    player1.win
    player1.win
    game.end_game
    assert_equal(player1.name, game.winner)
  end
  
end#classend