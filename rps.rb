# Player classes + overall driver method. Driver method should create players,
# tell the players to prompt for moves, and determine the winner. Players
# should keep track of their names and moves, and should still only accept
# valid moves. From the user’s perspective, the game should appear to work
# exactly the same.
    

def driver
  player1 = Player.new("player1")
  player2 = Player.new("player2")
  
  goodmove = ["rock", "paper", "scissors"]
  loop do
    puts 'Player 1: rock paper or scissors'
    player1.move = gets.chomp
  break if goodmove.include?(player1.move)
  end
  
  
  loop do
    puts 'Player 2: rock paper or scissors'
    player2.move = gets.chomp
  break if goodmove.include?(player2.move)
  end
  
  hash = {"rock" => "scissors", "scissors" => "paper", "paper" => "rock"}
  if player2.move == hash[player1.move]
    puts 'Player 1 wins'
  elsif player1.move == hash[player2.move]
    puts 'Player 2 wins'
  else puts 'tie'
    
  end
end

class Player
  attr_reader :name
  attr_accessor :move

  def initialize(name)
    @name = name
  end
  
end

driver
  