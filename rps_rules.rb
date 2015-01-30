require 'pry'

class Rules
  attr_reader :rps_rules
  
  def initialize
    @rps_rules = ["rock", "paper", "scissors"]
    @rps_judge = {"rock" => "scissors", "scissors" => "paper", "paper" => "rock"}
  end
  
  def rps_rules