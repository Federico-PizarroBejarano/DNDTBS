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

  #--------------------------------------------------------------------------
  # * Draw Proficiency Bonus
  #--------------------------------------------------------------------------
  def draw_proficiency_bonus(x, y)
    draw_icon(125, x, y, true)
    change_color(normal_color, true)
    draw_text(x + 24, y, 172, line_height, " Prof. Bonus: +#{@actor.prof_bonus}")
  end
  #--------------------------------------------------------------------------
  # * Draw Armor Class
  #--------------------------------------------------------------------------
  def draw_armor_class(x, y, short=false)
    draw_icon(496, x, y, true)
    change_color(normal_color, true)
    if !short
      draw_text(x + 24, y, 172, line_height, " Armor Class: #{@actor.armor_class}")
    else
      draw_text(x + 24, y, 172, line_height, " AC: #{@actor.armor_class}")
    end
  end
  #--------------------------------------------------------------------------
  # * Draw Speed
  #--------------------------------------------------------------------------
  def draw_speed(x, y, short=false)
    draw_icon(479, x, y, true)
    change_color(normal_color, true)
    if !short
      draw_text(x + 24, y, 172, line_height, " Speed: #{@actor.move*5}ft")
    else
      draw_text(x + 24, y, 172, line_height, " Spd: #{@actor.move*5}ft")
    end
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
    draw_armor_class(304, y+1.1*line_height)
    draw_speed(304, y+2.2*line_height)
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
    draw_actor_stat(@actor, x, y + line_height * 0, "STR", @actor.str, @actor.str_mod)
    draw_actor_stat(@actor, x, y + line_height * 1, "DEX", @actor.dex, @actor.dex_mod)
    draw_actor_stat(@actor, x, y + line_height * 2, "CON", @actor.con, @actor.con_mod)
    draw_actor_stat(@actor, x, y + line_height * 3, "INT", @actor.int, @actor.int_mod)
    draw_actor_stat(@actor, x, y + line_height * 4, "WIS", @actor.wis, @actor.wis_mod)
    draw_actor_stat(@actor, x, y + line_height * 5, "CHA", @actor.cha, @actor.cha_mod)
  end
  #--------------------------------------------------------------------------
  # * Draw Stats
  #--------------------------------------------------------------------------
  def draw_actor_stat(actor, x, y, text, stat, mod)
    change_color(system_color)
    draw_text(x, y, 120, line_height, text)
    change_color(normal_color)
    if mod >= 0
      mod_text = " (+#{mod})"
    else
      mod_text = " (#{mod})"
    end
    draw_text(x + 110, y, 72, line_height, stat.to_s + mod_text, 2)
  end
end

#===============================================================================
# Windows_Status_GTBS
#===============================================================================
class Windows_Status_GTBS < TBS_Window_Base
  #----------------------------------------------------------------------------
  # Draw Actor Info
  #----------------------------------------------------------------------------
  alias dnd_clear_info clear_info
  def clear_info
    dnd_clear_info
    self.contents.clear_rect( 0, 80, 96, 96)  # Clears AC and speed
  end

  alias dnd_draw_actor_info draw_actor_info
  def draw_actor_info
    dnd_draw_actor_info
    draw_armor_class(0, 80, short=true) if @actor
    draw_speed(0, 80+line_height*1.1, short=true) if @actor
  end
end
