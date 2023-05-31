class Game_Battler < Game_BattlerBase
  #--------------------------------------------------------------------------
  # * Calculate Damage
  #--------------------------------------------------------------------------
  def make_gtbs_dmg_preview_data(user, item)
    #expected preview data 
    #[hit_chance, damage, amp, hit_states, rem_states]
    hit_chance = (item_hit_chance(user, item) * 100).to_i
    damage = user.damage_roll(average=true)
    result = Game_ActionResult.new(self)
    result.make_damage(damage, item)
    return [hit_chance, damage, 0, result.added_states, result.removed_states, false]
  end

  def item_hit_chance(user, item)
    weapon = user.weapons[0]
    mod = user.attack_mod(weapon)
    if self.can_use_weapon(weapon)
      mod = mod + self.prof_bonus      
    end
    hit_chance = (21 - self.armor_class + mod)/(20.to_f)
    hit_chance = [hit_chance, 0.05].max
    hit_chance = [hit_chance, 0.95].min
    return hit_chance
  end
end