#===============================================================================
# Window ActList
#===============================================================================
class Window_ActList < TBS_Window_Selectable
  Offset_Down = 20
  WLH = 32
  #--------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------
  def initialize(actor, act_list = nil)
    @act_list = []
    @act_list = []
    added_enemies = []
    for act in act_list
      if act.is_a?(Game_Actor)
        @act_list << act
      else
        if !added_enemies.include?(act.enemy_id)
          enemies = act_list.select{|enemy| enemy.is_a?(Game_Enemy) && enemy.enemy_id == act.enemy_id}
          added_enemies << act.enemy_id
          if enemies.size > 1
            @act_list << enemies
          else
            @act_list << enemies[0]
          end
        end
      end
    end
    @actor = actor
    div = 8
    x = (Graphics.width/2) - 120
    y = 60
    super(x, y, 240, 0)
    self.height = 30*[@act_list.size, 240].min 
    self.index = 0
    @item_max = 1
    refresh
    self.activate
  end
  def col_max
    return 1
  end
  def item_max
    @act_list.size
  end
  def update
    last_index = self.index
    super
    if last_index != self.index
      refresh
    end
  end
  #--------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------
  def refresh
    self.contents.clear
    for i in 0...@act_list.size
      draw_list_item(i)
    end
  end
  #--------------------------------------------------------------
  # * Draw List Item
  #--------------------------------------------------------------
  def draw_list_item(i)
    if @act_list[i].is_a?(Array)
      string = @act_list[i][0].name
      string += "s" if @act_list[i][0].name[-1] != 's'
      atb_num = @act_list[i][0].atb
    else
      string = @act_list[i].name
      atb_num = @act_list[i].atb
    end
    if @act_list[i] == @actor
      self.contents.font.color = GTBS::Act_List_Select_Color
    else
      self.contents.font.color = GTBS::Act_List_Normal_Color
    end

    rect = item_rect(i)
    num_spaces = 12-string.size-atb_num.to_s.size
    self.contents.draw_text(rect,"#{i+1} : #{string}" + " "*num_spaces + "(#{atb_num})")
  end
  #--------------------------------------------------------------
  # Data - Returns the actor for the selected line
  #--------------------------------------------------------------
  def data
    actor = @act_list[self.index]
    if actor.is_a?(Array)
      return actor[0]
    else
      return actor
    end
  end
end