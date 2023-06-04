class Game_BattlerBase
  attr_accessor   :str                       # STR  Strength
  attr_accessor   :dex                       # DEX  Dexterity
  attr_accessor   :con                       # CON  Constitution
  attr_accessor   :int                       # INT  Intelligence
  attr_accessor   :wis                       # WIS  Wisdom
  attr_accessor   :cha                       # CHA  Charisma
  attr_accessor   :prof_bonus                # Proficiency bonus
  attr_accessor   :move                      # Number of 5ft tiles they can move

  def str_mod
    return (@str-10)/2
  end
  def dex_mod
    return (@dex-10)/2
  end
  def con_mod
    return (@con-10)/2
  end
  def int_mod
    return (@int-10)/2
  end
  def wis_mod
    return (@wis-10)/2
  end
  def cha_mod
    return (@cha-10)/2
  end

  #--------------------------------------------------------------------------
  # * Determine if Equippable
  #--------------------------------------------------------------------------
  def equippable?(item)
    return false unless item.is_a?(RPG::EquipItem)
    return false if equip_type_sealed?(item.etype_id)
    return equip_wtype_ok?(item) if item.is_a?(RPG::Weapon)
    return equip_atype_ok?(item) if item.is_a?(RPG::Armor)
    return false
  end
  #--------------------------------------------------------------------------
  # * Determine if Weapon Can Be Equipped
  #--------------------------------------------------------------------------
  def equip_wtype_ok?(item)
    equippable = features_set(FEATURE_EQUIP_WTYPE).include?(item.wtype_id)
    equippable = equippable || self.DND_equippable_weapons.include?(item.id)
  end
  #--------------------------------------------------------------------------
  # * Determine if Armor Can Be Equipped
  #--------------------------------------------------------------------------
  def equip_atype_ok?(item)
    equippable = features_set(FEATURE_EQUIP_ATYPE).include?(item.atype_id)
    equippable = equippable && (self.str >= item.DND_armor_min_str)
  end
end

class Game_Battler < Game_BattlerBase
  #--------------------------------------------------------------------------
  # * Checks whether the character can use a given weapon
  #--------------------------------------------------------------------------
  def can_use_weapon(weapon)
    return true
  end
  
  #--------------------------------------------------------------------------
  # * The character's Armor Class (AC)
  #--------------------------------------------------------------------------
  def armor_class
    shield_bonus = 0
    ac = 10 + self.dex_mod
    for armor in self.armors
      if armor.nil?                                                     
        ac = 10 + self.dex_mod                                             # No Armor
      elsif armor.atype_id == 1
        ac = armor.DND_base_armor + self.dex_mod                           # Light Armor 
      elsif armor.atype_id == 2
        ac = armor.DND_base_armor + [self.dex_mod, 2].min                  # Medium Armor
      elsif armor.atype_id == 3
        ac = armor.DND_base_armor                                          # Heavy Armor
      elsif armor.atype_id == 4
        shield_bonus = 2                                                   # Heavy Armor
      end
    end

    return ac + shield_bonus
  end

  #--------------------------------------------------------------------------
  # * The modifier on the roll used for an attack with a weapon
  #--------------------------------------------------------------------------
  def attack_mod(weapon)
    if weapon.nil? || weapon.DND_finesse_weapon
      mod = [self.dex_mod, self.str_mod].max
    elsif weapon.DND_melee_weapon
      mod = self.str_mod
    else
      mod = self.dex_mod
    end
    return mod
  end

  #--------------------------------------------------------------------------
  # * Rolls an attack
  #--------------------------------------------------------------------------
  def attack_roll(advantage=false, disadvantage=false)
    print "[ATTACK ROLL] #{self.name} is attacking. AVD: #{advantage} DIS: #{disadvantage}!\n"
    roll = DNDTBS::rolld20(advantage, disadvantage)
    if roll == 1
      print "[ATTACK ROLL] #{self.name} rolled a critical miss!\n"
      return -100
    elsif roll == 20
      print "[ATTACK ROLL] #{self.name} rolled a critical hit!\n"
      return 100
    end

    weapon = self.weapons[0]
    mod = self.attack_mod(weapon)
    if self.can_use_weapon(weapon)
      mod = mod + self.prof_bonus      
    end
    roll = roll + mod

    print "[ATTACK ROLL] #{self.name} rolled #{roll-mod} + #{mod}!\n"

    return roll
  end

  #--------------------------------------------------------------------------
  # * Rolls damage
  #--------------------------------------------------------------------------
  def damage_roll(average=false)
    weapon = self.weapons[0]
    if weapon.nil?
      roll = DNDTBS::roll(1, 4, average)
    else
      roll = DNDTBS::roll(weapon.DND_dmg_dice_num, weapon.DND_dmg_die, average)
    end

    print "[DAMAGE ROLL] #{self.name} rolled #{roll} for a total of #{roll + self.attack_mod(weapon)} damage!\n"

    roll = roll + self.attack_mod(weapon)

    return roll
  end
end

class Game_Actor < Game_Battler
  attr_accessor   :DND_equippable_weapons         # item ids of additionally equippable items

  alias dnd_actor_initialize initialize
  def initialize(actor_id)
    @actor_id = actor_id
    @str = self.actor.str
    @dex = self.actor.dex
    @con = self.actor.con
    @int = self.actor.int
    @wis = self.actor.wis
    @cha = self.actor.cha
    @prof_bonus = self.actor.prof_bonus
    @move = self.actor.move
    @DND_equippable_weapons = []
    dnd_actor_initialize(actor_id)
  end
end

class Game_Enemy < Game_Battler
  alias dnd_enemy_initialize initialize
  def initialize(index, enemy_id)
    @enemy_id = enemy_id
    @str = self.enemy.str
    @dex = self.enemy.dex
    @con = self.enemy.con
    @int = self.enemy.int
    @wis = self.enemy.wis
    @cha = self.enemy.cha
    @prof_bonus = self.enemy.prof_bonus
    @move = self.enemy.move
    dnd_enemy_initialize(index, enemy_id)
  end
end