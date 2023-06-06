module DNDTBS
  UNARMED_ATTACK_WEAPON_ID         = 11               # unarmed attack

  #--------------------------------------------------------------------------
  # * Roll a d20 with advantage or disadvantage
  #--------------------------------------------------------------------------
  def self.rolld20(advantage=false, disadvantage=false)
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
  
  #--------------------------------------------------------------------------
  # * Roll any number of dice with any given number of sides
  #--------------------------------------------------------------------------
  def self.roll(quantity=1, sides=100, average=false)
    if average
      total = (sides/2+0.5)*quantity
      total = total.to_i
    else
      total = 0
      while quantity > 0
        total += 1+rand(sides)
        quantity -= 1
      end
    end
    return total
  end
end
