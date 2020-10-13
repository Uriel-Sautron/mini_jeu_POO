require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

@enemies = []

#def welcome
  puts " ""~"*24
  puts "|   Bienvenue sur 'ILS VEULENT TOUS MA POO' !   |"
  puts "|Le but du jeu est d'être le dernier survivant !|"
  puts " ""~"*24
#end

#def choose_name
  puts "Donne un nom a ton Guerrier :"
  print "=>"
  @name = gets.chomp
  user = HumanPlayer.new(@name)
#end



#def fight
  @enemies << player1 = Player.new("Josiane")
  @enemies << player2 = Player.new("José")
  while user.life_points > 0 && (player1.life_points > 0 || player2.life_points >0)
    puts "Voici l'état de ton Guerrier :"
    puts ""
    puts user.show_state
    gets.chomp
    puts "#{"-"*50}\n\n"\
         "#{" "*8}Quelle action veux-tu effectuer ?\n\n"\
         "a - chercher une meilleure arme\n"\
         "s - chercher à se soigner\n\n\n"\
         "#{" "*8}Attaquer un joueur en vue :\n\n"\
         "0 - #{player1.name} a #{player1.life_points} points de vie\n"\
         "1 - #{player2.name} a #{player2.life_points}  points de vie\n\n"\
         "#{"-"*50}\n\n"\
         "PAR ICI GUERRIER ⬇️ "
    choice = gets.chomp
    case choice
    when "a"
      user.search_weapon
    when "s"
      user.search_health_pack
    when "0"
      user.attacks(player1)
    when "1"  
      user.attacks(player2) 
    else 
      puts "Ah dommage tu aurais du choisir une action valable." 
    end 
    puts "\nAttention prépare toi c'est a l'ennemis d'attaquer !\n"
    gets.chomp
    @enemies.each{|player| 
    if player.life_points > 0 
    player.attacks(user)
    else puts "#{player.name} est mort et les morts n'attaques pas ... enfin pour l'instant !"
    end}
  end
  if user.life_points > 0
    puts "BRAVO ! TU T'EN ES SORTIE VIVANT !"
  else
    puts "Loser ! Tu as perdu !"
  end
 
#end
      
#binding.pry 

         
         
         
         