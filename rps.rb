
    
puts 'user 1: rock paper or scissors'
user1 = gets.chomp
puts 'user 2: rock paper or scissors'
user2 = gets.chomp

hash = {"rock" => "scissors", "scissors" => "paper", "paper" => "rock"}
if user2 == hash[user1]
  puts 'user 1 wins'
elsif user1 == hash[user2]
  puts 'user 2 wins'
else puts 'tie'
  
end

