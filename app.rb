require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def battle
  player1 = Player.new("Josiane")
  player2 = Player.new("José")

  while player1.life_points > 0 && player2.life_points > 0 do
    puts "="*41
    puts "Voici l' état de chaque joueur :"
    puts ""
    puts player1.show_state
    puts player2.show_state
    puts "Passons à la phase d'attaque :"
    print " "*17
    puts "FIGHT !"
    player1.attacks(player2)
    break if player2.life_points <= 0
    puts ""
    player2.attacks(player1)
  end
  
end
battle
binding.pry