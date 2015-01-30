require 'pry'
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
  
  def win
    @score += 1
  end
  
  def make_move(rules)
    loop do
      puts "#{@name}: rock paper or scissors"
      @move = gets.chomp
    break if rules.include?(move)
    puts "not a valid move"
    end
  end
  
end