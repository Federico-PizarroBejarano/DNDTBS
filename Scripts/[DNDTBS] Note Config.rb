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
  #            
  #==============================================================

  # a parameter is set with an array [ Hash_To_Store, reg_exp, is_bool?, protect_string?

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
    [->(obj, val){ obj.prof_bonus = val }, /^prof_bonus\s*=\s*(\d+)/i, 1],
  ]
  
  # DATA_ACTORS Config
  DND_ACTOR_EASY_CONFIG = [
    [->(obj, val){ obj.str = val }, /^str\s*=\s*(\d+)/i, 1],
    [->(obj, val){ obj.dex = val }, /^dex\s*=\s*(\d+)/i, 1],
    [->(obj, val){ obj.prof_bonus = val }, /^prof_bonus\s*=\s*(\d+)/i, 1],
  ]
  
  # DND_CLASS_EASY_CONFIG = [
  #   [CLASS_MOVE_RANGE, /^move\s*=\s*(\d+)/i],
  # ]
  
  #============================================================================
  #  You don't have to modify this
  #============================================================================
  #  End of Easy Config script
  #  This will effectively load the settings for the game
  #============================================================================
  # the database parser
  # type = name of the file
  # all_config = one of the array define above
  def self.easy_config(type, all_config)
    case type
    when 'Actors'
      obj_array = $game_actors
    else
      # TODO
      obj_array = $game_actors
    end

    data = load_data('Data/'+type+'.rvdata2')    
    max = data.size
    if type == 'MapInfos'
      max += 1
    end
    for i in 1...max
      if type == 'MapInfos'
        filename = sprintf("Data/Map%03d.rvdata2", i)
        if (File.exist?(filename) == false)
          next
        end
        note = load_data(filename).note
      else
        note = data[i].note
      end
      note.gsub!(/[ \t\r\f]/,"") 
      for line in note.split("\n")
        for config in all_config
          line_note = line.clone
          #unless config[3]
          #  
          #end
          line_note.scan(config[1])
          if $1
            case config[2]
            when 2 # set string
              config[0].call(obj_array[i], $1)
            when 1 # set int
              config[0].call(obj_array[i], $1)
            when 0 # set to true
              config[0].call(obj_array[i])
            else#value parameter
              raise "Invalid note config type"
            end
            break
          end
        end
      end
    end
  end
  
  START_ACTION_TAG   = /^<ACTION_LIST>/i
  END_ACTION_TAG     = /^<\/ACTION_LIST>/i
  
  SCAN_ACTION_TAG    = /^\s*([A-Z]*)\s*([A-Z]*):\s*(.+)/i
  SCAN_ACTION_FOLLOW = /[^, ]+[^,]*/i
  SCAN_ACTION_SMALL  = /^\s([A-Z]*)\s*:\s*(.+)/i
  
  def self.action_config(type)
    data = load_data('Data/'+type+'.rvdata2')    
    max = data.size
    @defining_action_tag = false
    
    #this = eval("GTBS::ACTION_#{type.upcase}")
    
    for i in 1...max
      note = data[i].note
      note.gsub!(/[\t\r\f]/,"") 
      eval("GTBS::ACTION_#{type.upcase}")[i] = []
      for line in note.split("\n")
        case line
        when START_ACTION_TAG
          @defining_action_tag = true
        when END_ACTION_TAG
          @defining_action_tag = false
        else
          next unless @defining_action_tag
          case line
          when SCAN_ACTION_TAG
            action = $1
            source = $2
            params = $3.scan(SCAN_ACTION_FOLLOW)
            eval("GTBS::ACTION_#{type.upcase}")[i] << [action, source, params]
          when SCAN_ACTION_SMALL
            action = $1
            type = $2
            eval("GTBS::ACTION_#{type.upcase}")[i] << [action, type, []]
          end
        end
      end
      
      #if this[i] != []
      #  for entry in this[i]
      #    p entry
      #  end      
      #end
    end
  end
  
  # self.action_config("Skills")
  # self.action_config("Items")
  # self.action_config("Weapons")
  
  # self.easy_config('Skills', DND_SKILLS_EASY_CONFIG)
  # self.easy_config('Items', DND_ITEMS_EASY_CONFIG)
  self.easy_config('Weapons', DND_WEAPONS_EASY_CONFIG)
  self.easy_config('Armors', DND_ARMORS_EASY_CONFIG)
  self.easy_config('Enemies', DND_ENEMIES_EASY_CONFIG)
  # self.easy_config('States', DND_STATES_EASY_CONFIG)
  self.easy_config('Actors', DND_ACTOR_EASY_CONFIG)
  # self.easy_config('Classes', DND_CLASS_EASY_CONFIG)
  # self.easy_config('MapInfos', DND_MAP_EASY_CONFIG)
  # self.easy_config('Troops', DND_TROOP_EASY_CONFIG)
  
  def self.text_reg_exp(exp)
    note = "move user: target feet, time 10"##"w_range=[2, 0, true, false, 0]"#
    note.match(exp)
    #p mtc.size
    #p "Match#0 #{mtc[0]}, Match #1 (#{mtc[1]}), Match #2 (#{mtc[2]}), Match #3 (#{mtc[3]})"
    if $1
      p $1, $2, $3
      p $3.scan(SCAN_ACTION_FOLLOW)
    else
      p "no match"
    end
  end
  exp = SCAN_ACTION_TAG#/^w_range[ ]*=[ ]*(\[[ ]*[\d+,]{3}(true|false)\s*,\s*(true|false)\s*,\s*\d+\s*(,\s*\d+\s*,\s*\d+\s*)?\])/
  #new_exp = /[ ]*(.*):[ ]*(.*)/i
  #text_reg_exp(exp)
  
  #print the desired variable here to validate what was read from the db notes
  #in regards to it
  #p BackDrop_MAP_Default
  #p Enemy_Weapon_Range
end
