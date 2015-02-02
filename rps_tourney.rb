class Tourney
  attr_reader :rules, :best_of, :champion
  attr_accessor :players, :game
  
  def initialize(players, rules)
    @players = players
    @rules = rules
    @best_of = 3
    @champion = ""
  end
  
  def matchmaker
    puts "#{(game.loser).name} is eliminated!"
    if game.winner == game.player1
      players.slice!(1)
    else players.slice!(0)
    end
    @champion = @players[0] if @players.count == 1
    @players.rotate!
    puts "Press anything to play next game"
    move_on = gets.chomp
  end
  
  def new_game
    player1 = @players[0]
    player2 = @players[1]
    @game = Game.new(player1, player2, best_of, rules)
    game.play
  end
  
  def start
    until @champion != ""
      new_game
      matchmaker
    end
    puts "#{champion.name} is the champion of the Tourney!"
  end
  
end#classend