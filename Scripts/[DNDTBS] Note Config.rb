module DNDTBS
  #==============================================================
  # Easy Config by Clarabel
  # Load the settings done in the note place in the editor
  # All note entries must be on separate line
  #==============================================================
  # case ConfigType
  # when 0
  #   set true
  # when 1
  #   save int
  # when 2
  #   save string    
  #==============================================================

  # DATA_WEAPONS Config
  DND_WEAPONS_EASY_CONFIG = [
    [->(obj){ obj.DND_melee_weapon = true }, /(^melee)/i, 0],
    [->(obj){ obj.DND_finesse_weapon = true },/(^finesse)/i, 0],
    [->(obj, val){ obj.DND_dmg_die = val }, /^dmg_die\s*=\s*(\-*\d+)/i, 1],
    [->(obj, val){ obj.DND_dmg_dice_num = val }, /^dmg_dice_num\s*=\s*(\-*\d+)/i, 1],
  ]
  
  # DATA_ARMORS Config
  DND_ARMORS_EASY_CONFIG =[
    [->(obj, val){ obj.DND_type = val }, /^type\s*=\s*(\-*\d+)/i, 1],
    [->(obj, val){ obj.DND_base_armor = val }, /^base_armor\s*=\s*(\-*\d+)/i, 1],
    [->(obj, val){ obj.DND_max_dex = val }, /^max_dex\s*=\s*(\-*\d+)/i, 1],
  ]
  
  # DATA_ENEMIES Config
  DND_ENEMIES_EASY_CONFIG =[
    [->(obj, val){ obj.str = val }, /^str\s*=\s*(\d+)/i, 1],
    [->(obj, val){ obj.dex = val }, /^dex\s*=\s*(\d+)/i, 1],
    [->(obj, val){ obj.con = val }, /^con\s*=\s*(\d+)/i, 1],
    [->(obj, val){ obj.int = val }, /^int\s*=\s*(\d+)/i, 1],
    [->(obj, val){ obj.wis = val }, /^wis\s*=\s*(\d+)/i, 1],
    [->(obj, val){ obj.cha = val }, /^cha\s*=\s*(\d+)/i, 1],
    [->(obj, val){ obj.prof_bonus = val }, /^prof_bonus\s*=\s*(\d+)/i, 1],
  ]
  
  # DATA_ACTORS Config
  DND_ACTOR_EASY_CONFIG = [
    [->(obj, val){ obj.str = val }, /^str\s*=\s*(\d+)/i, 1],
    [->(obj, val){ obj.dex = val }, /^dex\s*=\s*(\d+)/i, 1],
    [->(obj, val){ obj.con = val }, /^con\s*=\s*(\d+)/i, 1],
    [->(obj, val){ obj.int = val }, /^int\s*=\s*(\d+)/i, 1],
    [->(obj, val){ obj.wis = val }, /^wis\s*=\s*(\d+)/i, 1],
    [->(obj, val){ obj.cha = val }, /^cha\s*=\s*(\d+)/i, 1],
    [->(obj, val){ obj.prof_bonus = val }, /^prof_bonus\s*=\s*(\d+)/i, 1],
  ]
  
  # type = name of the file
  # all_config = one of the array define above
  def self.easy_config(type, all_config)
    case type
    when 'Actors'
      obj_array = $data_actors
    when 'Weapons'
      obj_array = $data_weapons
    when 'Armors'
      obj_array = $data_armors
    when 'Enemies'
      obj_array = $data_enemies
    else
      raise "Unknown Config"
    end

    data = load_data('Data/'+type+'.rvdata2')    
    max = data.size
    for i in 1...max
      note = data[i].note
      note.gsub!(/[ \t\r\f]/,"") 
      for line in note.split("\n")
        for config in all_config
          line_note = line.clone
          line_note.scan(config[1])
          if $1
            case config[2]
            when 2 # set string
              config[0].call(obj_array[i], $1)
            when 1 # set int
              config[0].call(obj_array[i], $1.to_i)
            when 0 # set to true
              config[0].call(obj_array[i])
            else
              raise "Invalid note config type"
            end
            break
          end
        end
      end
    end
  end
  
  ### FOR DEBUGGING ###
  # DataManager.init
  # self.easy_config('Weapons', DND_WEAPONS_EASY_CONFIG)
  # self.easy_config('Armors', DND_ARMORS_EASY_CONFIG)
  # self.easy_config('Enemies', DND_ENEMIES_EASY_CONFIG)
  # self.easy_config('Actors', DND_ACTOR_EASY_CONFIG)
  
  # julie = $game_actors[1]
  # jappa = $game_actors[2]
  # ambriel = $game_actors[3]
  # enemy = Game_Enemy.new(1, 1)
  # print "\n #{ambriel.weapons[0].name}\n"
  # print "\n #{ambriel.attack_mod(julie.weapons[0])}"
  # print "\n #{enemy.attack_mod(enemy.weapons[0])}\n"
end
