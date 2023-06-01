class Game_BattlerBase
  attr_accessor   :str                       # STR  Strength
  attr_accessor   :dex                       # DEX  Dexterity
  attr_accessor   :con                       # CON  Constitution
  attr_accessor   :int                       # INT  Intelligence
  attr_accessor   :wis                       # WIS  Wisdom
  attr_accessor   :cha                       # CHA  Charisma
  attr_accessor   :prof_bonus                # Proficiency bonus

  alias dnd_battlerbase_initialize initialize unless $@
  def initialize
    dnd_battlerbase_initialize
    @str = @dex = @con = @int = @wis = @cha = 10
    @prof_bonus = 0
  end

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
    armor = self.armors[0]
    if armor.nil?                                                     
      return 10 + self.dex_mod                                             # No Armor
    elsif armor.DND_type == 0
      return armor.DND_base_armor + self.dex_mod                           # Light Armor 
    elsif armor.DND_type == 1
      return armor.DND_base_armor + [self.dex_mod, armor.DND_max_dex].min  # Medium Armor
    elsif armor.DND_type == 2
      return armor.DND_base_armor                                          # Heavy Armor
    end
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
  alias dnd_actor_initialize initialize
  def initialize(*args)
    dnd_actor_initialize(*args)
    @str = self.actor.str
    @dex = self.actor.dex
    @con = self.actor.con
    @int = self.actor.int
    @wis = self.actor.wis
    @cha = self.actor.cha
    @prof_bonus = self.actor.prof_bonus
  end
end

class Game_Enemy < Game_Battler
  alias dnd_enemy_initialize initialize
  def initialize(*args)
    dnd_enemy_initialize(*args)
    @str = self.enemy.str
    @dex = self.enemy.dex
    @con = self.enemy.con
    @int = self.enemy.int
    @wis = self.enemy.wis
    @cha = self.enemy.cha
    @prof_bonus = self.enemy.prof_bonus
  end
end