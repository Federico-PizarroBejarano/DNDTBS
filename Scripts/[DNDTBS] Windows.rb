class Window_Base < Window
  #--------------------------------------------------------------------------
  # * Draw Simple Status
  #--------------------------------------------------------------------------
  def draw_actor_simple_status(actor, x, y)
    draw_actor_name(actor, x, y)
    draw_actor_level(actor, x, y + line_height * 1)
    draw_actor_icons(actor, x, y + line_height * 2)
    draw_actor_class(actor, x + 120, y)
    draw_actor_hp(actor, x + 120, y + line_height * 1)
    # draw_actor_mp(actor, x + 120, y + line_height * 2)
  end
end

class Window_Status < Window_Selectable
  #--------------------------------------------------------------------------
  # * Draw Block 1
  #--------------------------------------------------------------------------
  def draw_block1(y)
    draw_actor_name(@actor, 4, y)
    draw_actor_class(@actor, 128, y)
    # draw_actor_nickname(@actor, 288, y)
  end
  #--------------------------------------------------------------------------
  # * Draw Block 2
  #--------------------------------------------------------------------------
  def draw_block2(y)
    draw_actor_face(@actor, 8, y)
    draw_basic_info(136, y)
    # draw_exp_info(304, y)
    draw_proficiency_bonus(304, y)
    draw_armor_class(304, y+line_height)
  end
  #--------------------------------------------------------------------------
  # * Draw Basic Information
  #--------------------------------------------------------------------------
  def draw_basic_info(x, y)
    draw_actor_level(@actor, x, y + line_height * 0)
    draw_actor_icons(@actor, x, y + line_height * 1)
    draw_actor_hp(@actor, x, y + line_height * 2)
    # draw_actor_mp(@actor, x, y + line_height * 3)
  end
  #--------------------------------------------------------------------------
  # * Draw Parameters
  #--------------------------------------------------------------------------
  def draw_parameters(x, y)
    draw_actor_stat(@actor, x, y + line_height * 0, "STR", @actor.str)
    draw_actor_stat(@actor, x, y + line_height * 1, "DEX", @actor.dex)
    draw_actor_stat(@actor, x, y + line_height * 2, "CON", @actor.con)
    draw_actor_stat(@actor, x, y + line_height * 3, "INT", @actor.int)
    draw_actor_stat(@actor, x, y + line_height * 4, "WIS", @actor.wis)
    draw_actor_stat(@actor, x, y + line_height * 5, "CHA", @actor.cha)
  end
  #--------------------------------------------------------------------------
  # * Draw Stats
  #--------------------------------------------------------------------------
  def draw_actor_stat(actor, x, y, text, stat)
    change_color(system_color)
    draw_text(x, y, 120, line_height, text)
    change_color(normal_color)
    draw_text(x + 120, y, 36, line_height, stat, 2)
  end
  #--------------------------------------------------------------------------
  # * Draw Proficiency Bonus
  #--------------------------------------------------------------------------
  def draw_proficiency_bonus(x, y)
    draw_icon(125, x, y, true)
    change_color(normal_color, true)
    draw_text(x + 24, y, 172, line_height, "Prof. Bonus: +#{@actor.prof_bonus}")
  end
  #--------------------------------------------------------------------------
  # * Draw Armor Class
  #--------------------------------------------------------------------------
  def draw_armor_class(x, y)
    draw_icon(496, x, y, true)
    change_color(normal_color, true)
    draw_text(x + 24, y, 172, line_height, "Armor Class: #{@actor.armor_class}")
  end
end
