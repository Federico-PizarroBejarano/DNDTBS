class RPG::Actor
  attr_accessor   :str                       # STR  Strength
  attr_accessor   :dex                       # DEX  Dexterity
  attr_accessor   :con                       # CON  Constitution
  attr_accessor   :int                       # INT  Intelligence
  attr_accessor   :wis                       # WIS  Wisdom
  attr_accessor   :cha                       # CHA  Charisma
  attr_accessor   :prof_bonus                # Proficiency bonus

  alias dnd_rpg_actor_initialize initialize
  def initialize(*args)
    dnd_rpg_actor_initialize(*args)
    @str = @dex = @con = @int = @wis = @cha = 10
    @prof_bonus = 0
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

  alias dnd_rpg_enemy_initialize initialize
  def initialize(*args)
    dnd_rpg_enemy_initialize(*args)
    @str = @dex = @con = @int = @wis = @cha = 10
    @prof_bonus = 0
  end
end

class RPG::Armor
  attr_accessor   :DND_type
  attr_accessor   :DND_base_armor
  attr_accessor   :DND_max_dex

  alias dnd_rpg_armor_initialize initialize
  def initialize(*args)
    dnd_rpg_armor_initialize(*args)
    @DND_type = @DND_base_armor = @DND_max_dex = 0
  end
end

class RPG::Weapon
  attr_accessor   :DND_melee_weapon
  attr_accessor   :DND_finesse_weapon
  attr_accessor   :DND_dmg_die
  attr_accessor   :DND_dmg_dice_num
  
  alias dnd_rpg_weapon_initialize initialize
  def initialize(*args)
    dnd_rpg_weapon_initialize(*args)
    @DND_melee_weapon = false
    @DND_finesse_weapon = false
    @DND_dmg_die = @DND_dmg_dice_num = 0
  end
end