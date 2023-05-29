module RPG
  class Armor
    attr_accessor   :DND_type
    attr_accessor   :DND_base_armor
    attr_accessor   :DND_max_dex

    alias base_initialize initialize unless $@
    def initialize
      base_initialize
      @DND_type = @DND_base_armor = @DND_max_dex = 0
    end
  end

  class Weapon
    attr_accessor   :DND_melee_weapon
    attr_accessor   :DND_finesse_weapon
    attr_accessor   :DND_dmg_die
    attr_accessor   :DND_dmg_dice_num
    
    alias base_initialize initialize unless $@
    def initialize
      base_initialize
      @DND_melee_weapon = false
      @DND_finesse_weapon = false
      @DND_dmg_die = @DND_dmg_dice_num = 0
    end
  end
end