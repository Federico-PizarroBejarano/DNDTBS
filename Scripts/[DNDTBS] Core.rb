module DNDTBS
  def rolld20(advantage=false, disadvantage=false)
    roll = 1+rand(20)
    if advantage && disadvantage
      return roll
    end
    roll2 = 1+rand(20)
  
    if advantage
      roll = roll2 if roll2 > roll
    elsif disadvantage
      roll = roll2 if roll2 < roll
    end
    return roll
  end
  
  def roll(quantity=1, sides=100)
    total = 0
    while quantity > 0
      total += 1+rand(sides)
      quantity -= 1
    end
    return total
  end

  def calculate_DND_damage(attacker, defender)
    atk_roll = attacker.attack_roll()
    if atk_roll == -100                     # Crit miss
      return 0
    elsif atk_roll == 100                   # Crit hit
      return attacker.damage_roll()*2
    elsif atk_roll >= defender.armor_class  # Hit
      return attacker.damage_roll()
    else                                    # Miss
      return 0
    end
  end
end
