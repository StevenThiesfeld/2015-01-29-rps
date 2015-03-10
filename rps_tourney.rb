# Class: Tourney
# A collection of games to determine the champion.
#
# Attributes:
# @players    - Array:   The Player objects participating in the Tourney.
# @rules      - Rules:   The type of game being played.
# @best_of    - Integer: The number of rounds in each game (default 3).
# @champion   - Player:  The best around.  Noone can keep him down.
#
# Methods:
# #matchmaker
# #new_game
# #start

class Tourney
  attr_reader :rules, :best_of, :champion
  attr_accessor :players, :game
  
  def initialize(players, rules)
    @players = players
    @rules = rules
    @best_of = 3
    @champion = ""
  end
  
  # Method: #matchmaker
  # Manages the array of Players after a game is played.
  #
  # Parameters:
  # players  -  Array:  The array of players
  # champion -  Player: The last player object in the players array.
  #
  # Returns:
  # nil
  #
  # State Changes:
  # Slices the losing player from the array and rotates players in array.
  # Sets champion to the last player standing in the array.
  
  def matchmaker
    puts "#{(game.loser).name} is eliminated!"
    if game.winner == game.player1
      @players.slice!(1)
    else @players.slice!(0)     #can use @players.slice to cut the loser into a losers bracked
    end
    @champion = @players[0] if @players.count == 1
    @players.rotate!
    puts "Press enter to play next game"
    move_on = gets.chomp
  end
  
  # Method: #new_game
  # Starts a new Game between the next players in line.
  #
  # Parameters:
  # player1   - Player: The first player in the players array.
  # player2   - Player: The second player in the players array.
  # @game      - Game:   The game object currently being played.
  #
  # Returns:
  # nil
  #
  # State Changes:
  # Sets player1 and player2 to the first 2 players in array.
  # Sets @game to a new game involving player1 and player2.
  
  def new_game
    player1 = @players[0]
    player2 = @players[1]
    @game = Game.new(player1, player2, best_of, rules)
    game.play
  end
  
  # Method: #start
  # Plays games until one player is left standing.
  #
  # Parameters:
  # @champion  - Player: The last player left in players array.
  #
  # Returns:
  # nil
  #
  # State Changes:
  # none
  
  def start
    until @champion != ""
      new_game
      matchmaker
    end
    puts "#{champion.name} is the champion of the Tourney!"
  end
  
end#classend