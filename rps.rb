# Players should be able to play a best-of-n match,
#  which will require you to keep track of each player’s score.
    

def driver
  player1 = Player.new("player1")
  player2 = Player.new("player2")
  
  puts "best of:"
  best_of = gets.to_i
  
  until player1.score == (best_of / 2)+1 || player2.score == (best_of / 2)+1
  
    goodmove = ["rock", "paper", "scissors"]
    loop do
      puts 'Player 1: rock paper or scissors'
      player1.move = gets.chomp
    break if goodmove.include?(player1.move)
    puts "not a valid move"
    end


    loop do
      puts 'Player 2: rock paper or scissors'
      player2.move = gets.chomp
    break if goodmove.include?(player2.move)
    puts "not a valid move"
    end

    hash = {"rock" => "scissors", "scissors" => "paper", "paper" => "rock"}
    if player2.move == hash[player1.move]
      puts 'Player 1 wins'
      player1.score += 1
    elsif player1.move == hash[player2.move]
      puts 'Player 2 wins'
      player2.score += 1
    else puts 'tie'
    end
  end
  if player1.score > player2.score  
    puts "#{player1.name}takes the round"
  else
    puts "#{player2.name} takes the round"
  end
end


class Player
  attr_reader :name
  attr_accessor :move, :score

  def initialize(name)
    @name = name
    @score = 0
  end
  
end

driver
  