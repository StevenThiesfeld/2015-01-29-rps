# Every Player method should be unit-tested (with Minitest), including any edge cases.
#  Make sure to write both tests that should fail and tests that should pass.

# Method: driver
#
# Plays a round of RPS and announces the winner.
#
# Parameters:
# name1 - String: Name of player1.
# name2 - String: Name of player2.
#
# Returns:
# String: name of whichever player won the round
#
# State Changes:
# Creates new Player objects, sets Player.name.
# Sets player1 and player2 to created Player objects.
# Updates Player.move and Player.score



def driver(name1, name2)
  player1 = Player.new(name1)
  player2 = Player.new(name2)
  
  puts "best of:"
  best_of = gets.to_i
  
  until player1.score == (best_of / 2)+1 || player2.score == (best_of / 2)+1
  
    goodmove = ["rock", "paper", "scissors"]
    loop do
      puts "#{player1.name}: rock paper or scissors"
      player1.move = gets.chomp
    break if goodmove.include?(player1.move)
    puts "not a valid move"
    end


    loop do
      puts "#{player2.name}: rock paper or scissors"
      player2.move = gets.chomp
    break if goodmove.include?(player2.move)
    puts "not a valid move"
    end

    hash = {"rock" => "scissors", "scissors" => "paper", "paper" => "rock"}
    if player2.move == hash[player1.move]
      puts "#{player1.name} wins!"
      player1.score += 1
    elsif player1.move == hash[player2.move]
      puts "#{player2.name} wins!"
      player2.score += 1
    else puts 'tie'
    end
  end
  if player1.score > player2.score  
    puts "#{player1.name}takes the set"
  else
    puts "#{player2.name} takes the set"
  end
end

# Class: Player
# Someone playing a rousing game of RPS
#
# Attributes:
# @name     -String:  The name of the Player
# @score    -Integer: The player's score in the current set.
# @move     -String:  The move the player is making in the current game.
#
# Methods:
# none

class Player
  attr_reader :name
  attr_accessor :move, :score

  def initialize(name)
    @name = name
    @score = 0
  end
  
  
end

driver("New Guy", "RPS Champion Bob Cooper")
  