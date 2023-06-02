class Scene_Battle_TBS
  attr_accessor  :initiative_order
  attr_accessor  :current_initiative

  alias dnd_scene_battle_post_start post_start
  def post_start
    dnd_scene_battle_post_start
    @initiative_order = populate_list
    @current_initiative = -1
  end

  #--------------------------------------------------------------------------
  #* populate_list
  #-------------------------------------------------------------------------
  def populate_list
    next_battler_list = []
    list_battlers = tactics_all
    next_battler_list = list_battlers.sort_by {|obj| -obj.atb}
    return next_battler_list
  end
  
  #----------------------------------------------------------------------------
  # Process Battlers - Main battler update thread
  #----------------------------------------------------------------------------
  def process_atb
    while @active_battler == nil
      process_forced_action
      for battler in tactics_all
        battler.check_casting
      end
      return if @using_skill
      @use_spell = next_wait_skill(tactics_all) 
      return unless @use_spell.empty?
      @current_initiative = @current_initiative + 1
      print "[PROCESS_ATB] Initiative is now #{@current_initiative}.\n"
      if @current_initiative >= @initiative_order.size
        @current_initiative = 0
      end
      next_battler = @initiative_order[@current_initiative]
      print "[PROCESS_ATB] Next battler is #{next_battler.name}.\n"
      set_active_battler(next_battler)
      return
    end
  end

  alias dnd_update_window_item update_window_item
  def update_window_item
    @windows[Win_Item].actor = @active_battler
    dnd_update_window_item
  end
end