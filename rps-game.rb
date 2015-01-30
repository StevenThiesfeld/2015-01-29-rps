# require 'pry'
# require_relative 'rps'


class Game
  attr_reader :valid_move, :judge, :best_of
  attr_accessor :winner, :player1, :player2
  
  def initialize(player1, player2, best_of)
    @player1 = player1
    @player2 = player2
    @best_of = (best_of / 2) +1
    @valid_move = ["rock", "paper", "scissors"]
    @judge = {"rock" => "scissors", "scissors" => "paper", "paper" => "rock"}
    @winner = ""
    
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
  
  def scoreboard(victor)
    if victor != nil
      victor.score += 1
      puts "#{victor.name} won the round."
    end
    return player1.score, player2.score
  end
  
  def end_game
    if player1.score == best_of
      @winner = player1.name
      @winner
    elsif player2.score == best_of
      @winner = player2.name
      @winner
    end
  end
    
  def play
    loop do
      get_move(player1)
      get_move(player2)
      puts scoreboard(compare_moves)
      end_game
      break if end_game == winner
    end
  end
      
end #class end



# player1 = Player.new("Player 1")
# player2 = Player.new("Player 2")
#
#
# test = Game.new(player1, player2, 3)
#
# binding.pry