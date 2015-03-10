# Class: Game
#
# Plays a game between two given players.
#
# Attributes:
# @player1   -Player:  the first player of the game
# @player2   -Player:  the second player of the game
# @best_of   -Integer: how many games will be played
# @winner    -Player:  the overall winner
# @loser     -Player:  the overall loser
# @rules     -Rules:   the rules of rps 
#
# Public Methods:
# #scoreboard
# #end_game
# #play

class Game 
  attr_reader :end_score, :rules, :loser
  attr_accessor :winner, :player1, :player2
  
  def initialize(player1, player2, best_of, rules)
    @player1 = player1
    @player2 = player2
    @end_score = (best_of / 2) +1
    @winner = "" 
    @loser = ""
    @rules = rules 
    player1.score = 0
    player2.score = 0
  end
  
  # Public: #scoreboard
  # Adds a point to the victor of the round and displays score.
  #
  # Parameters:
  # round_winner - Integer: Indicates which player won (or tie)
  #
  # Returns:
  # nil
  #
  # State Changes:
  #round_winner gets set to the Player object that won.
  # round_winner.win increments player.score by 1.
  
  def scoreboard(round_winner)
    if round_winner != 0
        round_winner == 1 ? round_winner = @player1 : round_winner = @player2 
        puts "#{round_winner.name} won the round."
        round_winner.win
    else puts "tie"
    end
    puts "#{player1.name}: #{player1.score}", "#{player2.name}: #{player2.score}"
  end
  
  # Public: end_game
  # Ends the game when a player wins enough rounds.
  #
  # Parameters:
  # player1.score - Integer: The first player's score.
  # player2.score - Integer: The second player's score.
  # end_score     - Integer: The number of points needed to end the game.
  #
  # Returns:
  # nil
  #
  # State Changes:
  # Sets @winner to whoever has the most points.
  
  def end_game
    if player1.score == end_score
      @winner = player1
      @loser = player2
      puts "#{@winner.name} is the winner!"
    elsif player2.score == end_score
      @winner = player2
      @loser = player1
      puts "#{@winner.name} is the winner!"
    end
  end
  
  # Public: play
  # Plays a full round of rock paper scissors using methods.
  #
  # Parameters:
  # player1  - Player: The first Player.
  # player2  - Player: The first Player.
  # winner   - Player: Tells play to stop playing when someone has won.
  #
  # Returns:
  # winner - Player: The winner of the game.
  #
  # State Changes:
  # Sets round_winner to an Integer based on who won the round.
    
  def play
    until @winner != ""
      player1.make_move(rules)
      player2.make_move(rules)
      puts "#{player1.name} chose #{player1.move}"
      puts "#{player2.name} chose #{player2.move}"
      round_winner = rules.judge_game(player1.move, player2.move)
      scoreboard(round_winner)
      end_game
    end 
    winner  
  end
      
end #class end