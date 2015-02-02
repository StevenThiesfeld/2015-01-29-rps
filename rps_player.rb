# Class: Player_Factory
# Creates Player/AI_Player objects for games/tourneys.
#
# Attributes:
# @players_list - Array: An array of players for use in a tourney.
#
# Methods:
# #make_player
# #make_tourney

class Player_Factory
  attr_accessor :players_list
  
  def initialize
    @players_list = Array.new
  end
  
  # Method: #make_player
  # Creates a single Player or AI Player.
  #
  # Parameters:
  # player_num - Integer: The player's number assignment.
  #
  # Returns:
  # player - Player or AI_Player: the created player.
  #
  # State Changes:
  # Sets player to new Player object.
  
  def make_player(player_num)
    choice = 0
    puts "For Human Opponent type 1 \nFor Computer Opponent type 2"
    until choice == 1 || choice == 2
    choice = gets.to_i
      if choice == 1
        puts "Enter your name"
        player = Player.new(gets.chomp) 
      elsif choice == 2
        player = AI_Player.new("Computer #{player_num}")
      else puts "not a valid choice, pick again"
      end
    end
    player
  end
  
  # Method: make_players_list
  # Runs make_players multiple times and puts created players into an array.
  #
  # Parameters:
  # num_players - Integer: The number of players to make.
  # player_num  - Integer: Keeps track of what number of player is being made
  #
  # Returns:
  # players_list - Array: The created list of Player objects.
  #
  # State Changes:
  # Increments player_num by 1 for each player made.
  # Pushed players made to players_list.
  
  def make_players_list(num_players)
    player_num = 1
    num_players.times do
      players_list.push(make_player(player_num))
      player_num += 1
    end
    players_list
  end
  
end#classend
  





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
  attr_reader :name
  attr_accessor :move, :score

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
  attr_reader :name
  attr_accessor :move, :score
  
  def initialize(name)
    @name = name
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