class Game_Battler < Game_BattlerBase
  #--------------------------------------------------------------------------
  # * Calculate Damage
  #--------------------------------------------------------------------------
  def make_damage_value(user, item)
    @result.hp_damage = user.damage_roll()
    if @result.critical
      weapon = user.weapons[0]
      @result.hp_damage = 2*(@result.hp_damage - user.attack_mod(weapon)) + user.attack_mod(weapon)
    end
  end
  #--------------------------------------------------------------------------
  # * Applying Variance
  #--------------------------------------------------------------------------
  def apply_variance(damage, variance)
  end
  #--------------------------------------------------------------------------
  # * Applying Guard Adjustment
  #--------------------------------------------------------------------------
  def apply_guard(damage)
  end
  #--------------------------------------------------------------------------
  # * Damage Processing
  #    @result.hp_damage @result.mp_damage @result.hp_drain
  #    @result.mp_drain must be set before call.
  #--------------------------------------------------------------------------
  def execute_damage(user)
    on_damage(@result.hp_damage) if @result.hp_damage > 0
    self.hp -= @result.hp_damage
  end
  #--------------------------------------------------------------------------
  # * Calculate Counterattack Rate for Skill/Item
  #--------------------------------------------------------------------------
  def item_cnt(user, item)
    return 0                              # Return counterattack rate
  end
  #--------------------------------------------------------------------------
  # * Calculate Reflection Rate of Skill/Item
  #--------------------------------------------------------------------------
  def item_mrf(user, item)
    return 0
  end
  #--------------------------------------------------------------------------
  # * Calculate Hit Rate of Skill/Item
  #--------------------------------------------------------------------------
  def item_hit(user, item)
    return 0                         # Return calculated hit rate
  end
  #--------------------------------------------------------------------------
  # * Calculate Evasion Rate for Skill/Item
  #--------------------------------------------------------------------------
  def item_eva(user, item)
    return 0
  end
  #--------------------------------------------------------------------------
  # * Calculate Critical Rate of Skill/Item
  #--------------------------------------------------------------------------
  def item_cri(user, item)
  end
  #--------------------------------------------------------------------------
  # * Apply Normal Attack Effects
  #--------------------------------------------------------------------------
  def attack_apply(attacker)
    item_apply(attacker, $data_skills[attacker.attack_skill_id])
  end
  #--------------------------------------------------------------------------
  # * Apply Effect of Skill/Item
  #--------------------------------------------------------------------------
  def item_apply(user, item)
    @result.clear
    @result.used = item_test(user, item)
    print "[ITEM APPLY] #{self.name} is being attacked by #{user.name}.\n"
    atk_roll = user.attack_roll(advantage=false, disadvantage=self.guarding)
    @result.missed = atk_roll < self.armor_class
    print "[ITEM APPLY] #{user.name} attacks with #{atk_roll} against #{self.name}'s AC of #{self.armor_class}.\n"
    @result.evaded = false
    if @result.hit?
      print "[ITEM APPLY] #{user.name} hit!\n"
      unless item.damage.none?
        @result.critical = (atk_roll == 100)
        make_damage_value(user, item)
        execute_damage(user)
      end
      item.effects.each {|effect| item_effect_apply(user, item, effect) }
      item_user_effect(user, item)
    else
      print "[ITEM APPLY] #{user.name} missed!.\n"
    end
    print "\n"
  end
end