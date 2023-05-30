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
end

class Game_Battler < Game_BattlerBase
  def armor_class
    armor = self.armors[0]
    if armor.nil?                                                     
      return 10 + self.dex                                             # No Armor
    elsif armor.DND_type == 0
      return armor.DND_base_armor + self.dex                           # Light Armor 
    elsif armor.DND_type == 1
      return armor.DND_base_armor + [self.dex, armor.DND_max_dex].min  # Medium Armor
    elsif armor.DND_type == 2
      return armor.DND_base_armor                                      # Heavy Armor
    end
  end

  ### Attack Roll
  def attack_roll
    roll = DNDTBS::rolld20()
    if roll == 1
      return -100
    elsif roll == 20
      return 100
    end

    weapon = self.weapons[0]
    if weapon.nil? || weapon.DND_finesse_weapon
      mod = [self.dex, self.str].max
    elsif weapon.DND_melee_weapon
      mod = self.str
    else
      mod = self.dex
    end

    roll = roll + mod
    if self.can_use_weapon(weapon)
      roll = roll + self.prof_bonus      
    end

    return roll
  end

  ### Damage Roll
  def damage_roll
    weapon = self.weapons[0]

    if weapon.nil?
      roll = DNDTBS::roll(1, 4)
    else
      roll = DNDTBS::roll(weapon.DND_dmg_dice_num, weapon.DND_dmg_die)
    end

    if weapon.nil? || weapon.DND_finesse_weapon
      mod = [self.dex, self.str].max
    elsif weapon.DND_melee_weapon
      mod = self.str
    else
      mod = self.dex
    end

    roll = roll + mod

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