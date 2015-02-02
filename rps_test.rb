# require_relative 'rps_player'
# require_relative 'rps_game'
# require_relative 'rps_rules'
require_relative 'rps_driver'
require 'minitest/autorun'

class Test_Rules <Minitest::Test
  include Shared_Rules
  
  def test_Rules_rules    #works
    rules = RPS_Rules.new
    assert_equal(rules.rules, {"rock" => "scissors", "paper" => "rock", "scissors" => "paper"})
    rules2 = RPSLS_Rules.new
    assert_equal(rules2.rules, {"rock" => ["scissors", "lizard"],
              "paper" => ["rock", "spock"],
              "scissors" => ["lizard", "paper"],
              "lizard" => ["spock", "paper"],
              "spock" => ["rock", "scissors"] 
            })
    
  end
  
  def test_judge_game  #doesn't work come back to it
    rules = RPS_Rules.new
    player1 = Player.new("test")
    player2 = Player.new("test2")
    player1.move = "rock"
    player2.move = "paper"
    assert_equal(2, rules.judge_game("rock", "paper"))#pass
  end
end#classend
    

class Test_Player <Minitest::Test  #up to date
  
  def test_attributes
    player1 = Player.new("test")
    assert_equal("test", player1.name)#pass
    player1.score = 5 #should return error, means score can't be cheated
    assert_equal(0, player1.score)#should pass
  end
  
  def test_win
    player1 = Player.new("test")
    player1.win
    assert_equal(1, player1.score)
    player1.win
    assert_equal(2, player1.score)
  end
  
  def test_make_move #works
    rules = RPS_Rules.new
    player1 = Player.new("test")
    player2 = Player.new("test2")
    player1.make_move(rules)
    assert_kind_of(String, player1.move)
    assert_includes(rules.rules, player1.move)
  end
    
  
end#classend

class Test_Game <Minitest::Test  #up to date
  def test_scoreboard
    rules = RPS_Rules.new
    player1 = Player.new("test")
    player2 = Player.new("test2")
    game = Game.new(player1, player2, 3, rules)
    game.scoreboard(1)
    assert_equal(1, player1.score)
    game.scoreboard(2)
    assert_equal(1, player2.score)
  end
  
  def test_end_game
    rules = RPS_Rules.new
    player1 = Player.new("test")
    player2 = Player.new("test2")
    game = Game.new(player1, player2, 3, rules)
    player1.win
    player1.win
    game.end_game
    assert_equal(player1.name, game.winner)
  end
  
end#classend

class Test_Driver <Minitest::Test
  
  def test_make_players
    driver = Driver.new
    driver.make_players
    assert_kind_of(Player, driver.player1)
    assert_kind_of(AI_Player, driver.player2) #fails if you chose human
  end
  
  def test_pick_game
    driver = Driver.new
    driver.pick_game
    assert_kind_of(RPS_Rules, driver.rules) #fails if RPSLS chosen
  end
  
  def test_make_tourney_players
    driver = Driver.new
    driver.make_tourney_players
    assert_kind_of(Array, driver.players_list)
  end
    
    
end#classend



class Test_Player_Factory <Minitest::Test
  def test_make_players_list
    factory = Player_Factory.new
    assert_kind_of(Array, factory.make_players_list(3))
  end
end#classend