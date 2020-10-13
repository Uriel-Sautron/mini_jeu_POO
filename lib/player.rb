class Player

  attr_accessor :name, :life_points
  
  def initialize(name, life_points = 10)
        @name = name 
        @life_points = life_points
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie !"
  end

  def gets_damage(player_damage)
    @life_points = @life_points - player_damage
    if @life_points <= 0
      puts "Le joueur #{@name} a été tué ! RIP !"
    end
    return @life_points
  end

  def attacks(player)
      puts "\nLe joueur #{name} attaque le joueur #{player.name}."
      attacks_damage = compute_damage
      player.gets_damage(attacks_damage)
      if player.life_points > 0
      puts "Il lui inflige #{attacks_damage} points de dommage.\n\n"
      end
  end

  def compute_damage
    return rand(1..6)
  end

end


class HumanPlayer < Player 
  
  attr_accessor :weapon_level

  def initialize(name, life_points = 100)
    @weapon_level = 1
    super
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level} !"
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    power = rand(1..6)
    puts "Tu as trouveé une arme de niveau #{power} !"
    if power > @weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      @weapon_level = power
    else
      puts "Ton arme est bien meilleure on va jeté celle la !"
    end
  end

  def search_health_pack
    pack = rand(1..6)
    if pack == 1
      puts "Dommage, tu n'as rien trouvé ..."
      puts "Tu as toujours #{@life_points} points de vie !"
    elsif (2..5).include?(pack)
      puts "Bien, tu as trouvé un pack de +50 points de vie !"
        50.times { @life_points += 1 if @life_points < 100 }
        puts "Tu as maintenant #{@life_points} points de vie !"
    else 
      puts "Waow, tu as trouvé un pack de +80 points de vie !" 
        80.times { @life_points += 1 if @life_points < 100 }
        puts "Tu as maintenant #{@life_points} points de vie !"
    end
  end

end
    

  


