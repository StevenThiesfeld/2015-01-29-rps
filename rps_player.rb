# Class: Player
# Someone playing a rousing game of RPS
#
# Attributes:
# @name     -String:  The name of the Player
# @score    -Integer: The player's score in the current set.
# @move     -String:  The move the player is making in the current game.
#
# Methods:
# #win
# #make_move

class Player 
  attr_reader :name, :score
  attr_accessor :move

  def initialize(name)
    @name = name
    @score = 0
  end
  
  # Public: #win
  # Adds 1 point to player's score.
  #
  # Parameters:
  # none
  #
  # Returns:
  # none
  #
  # State Changes:
  # @score Integer increased by 1
  
  def win
    @score += 1
  end
  
  # Public: #make_move
  # Prompts the player for a move and will check if it's valid based on Rules Object given from Game.
  #
  # Parameters:
  # valid  -Rules: a list of accepted possible moves
  #
  # Returns:
  # none
  #
  # State Changes:
  # Sets @move to String: the player's move.

  def make_move(valid)
    @move = ""
    until (valid.rules).has_key?(@move) 
      puts "#{@name}, pick your move: #{valid.rules.keys}"
      @move = gets.chomp
    puts "not a valid move" if (valid.rules).include?(@move) == false
    end
    puts "#{@name} chose #{@move}"
  end
  
end

# Class: AI_Player
# A Player class for when noone likes you.
#
# Attributes:
# @name     -String:  The name of the AI.
# @score    -Integer: The AI's score in the current set.
# @move     -String:  The move the AI very carefully selects.
#
# Methods:
# #win
# #make_move

class AI_Player
  attr_reader :name, :score
  attr_accessor :move
  
  def initialize
    @name = "Computron"
    @score = 0
  end
  
  # Public: #win
  # Adds 1 point to AI's score.
  #
  # Parameters:
  # none
  #
  # Returns:
  # none
  #
  # State Changes:
  # @score Integer increased by 1
  
  def win
    @score += 1
  end
  
  # Public: #make_move
  # AI generates a move from a list of valid moves supplied by Rules object
  #
  # Parameters:
  # valid  -Rules: a list of accepted possible moves
  #
  # Returns:
  # none
  #
  # State Changes:
  # Sets @move to String: the AI's move.
  
  
  def make_move(valid)
    @move = valid.rules.keys.sample
    puts "#{@name} chose #{@move}"
  end
  
end#classend