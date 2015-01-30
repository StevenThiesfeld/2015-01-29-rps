require 'pry'
require_relative 'rps'


class Game
  attr_reader :valid_move, :judge, :best_of
  attr_accessor :winner
  
  def initialize(player1, player2, best_of)
    @player1 = player1
    @player2 = player2
    @best_of = (best_of / 2)+1
    @valid_move = ["rock", "paper", "scissors"]
    @judge = {"rock" => "scissors", "scissors" => "paper", "paper" => "rock"}
    @winner = "noone"
    
  end
  
  
  def get_move(player)
    loop do
      puts "#{player.name}: rock paper or scissors"
      player.move = gets.chomp
    break if valid_move.include?(player.move)
    puts "not a valid move"
    end
  end
  
  def compare_moves
    if player2.move == judge[player1.move]
      @player1
    elsif player1.move == judge[player2.move]
      @player2
    else puts 'tie'
    end
  end
  
  def scoreboard
  (compare_moves).score += 1 if compare_moves != 'tie'
  return player1.score, player2.score
  end
  
  def end_game
    if player1.score == best_of
      winner = player1
    elsif player2.score == best_of
      winner = player2
    end
      
    
    
  
end #class end



player1 = Player.new("Player 1")
player2 = Player.new("Player 2")


test = Game.new(player1, player2, 4)

binding.pry