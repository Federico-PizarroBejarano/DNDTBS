class RPG::Actor
  attr_accessor   :str                       # STR  Strength
  attr_accessor   :dex                       # DEX  Dexterity
  attr_accessor   :con                       # CON  Constitution
  attr_accessor   :int                       # INT  Intelligence
  attr_accessor   :wis                       # WIS  Wisdom
  attr_accessor   :cha                       # CHA  Charisma
  attr_accessor   :prof_bonus                # Proficiency bonus
  attr_accessor   :move                      # Number of 5ft tiles they can move

  def setup_DND()
    @str = @dex = @con = @int = @wis = @cha = 10
    @prof_bonus = 0
    @move=6
  end
end

class RPG::Enemy
  attr_accessor   :str                       # STR  Strength
  attr_accessor   :dex                       # DEX  Dexterity
  attr_accessor   :con                       # CON  Constitution
  attr_accessor   :int                       # INT  Intelligence
  attr_accessor   :wis                       # WIS  Wisdom
  attr_accessor   :cha                       # CHA  Charisma
  attr_accessor   :prof_bonus                # Proficiency bonus
  attr_accessor   :move                      # Number of 5ft tiles they can move

  def setup_DND()
    @str = @dex = @con = @int = @wis = @cha = 10
    @prof_bonus = 0
    @move = 6
  end
end

class RPG::Armor
  attr_accessor   :DND_base_armor
  attr_accessor   :DND_armor_min_str
  attr_accessor   :DND_armor_stealth_disadv

  def setup_DND()
    @DND_base_armor = 0
    @DND_armor_min_str = 0
    @DND_armor_stealth_disadv = false
  end
end

class RPG::Weapon
  attr_accessor   :DND_melee_weapon
  attr_accessor   :DND_finesse_weapon
  attr_accessor   :DND_dmg_die
  attr_accessor   :DND_dmg_dice_num
  attr_accessor   :DND_heavy_weapon
  attr_accessor   :DND_light_weapon
  attr_accessor   :DND_loading_weapon
  attr_accessor   :DND_two_handed_weapon
  attr_accessor   :DND_versatile_weapon
  
  def setup_DND()
    @DND_melee_weapon = true
    @DND_dmg_die = @DND_dmg_dice_num = 0

    @DND_finesse_weapon = false
    @DND_heavy_weapon = false
    @DND_light_weapon = false
    @DND_loading_weapon = false
    @DND_two_handed_weapon = false
    @DND_versatile_weapon = false
  end
end