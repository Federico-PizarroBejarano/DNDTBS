#===============================================================================
# Class Progress_Bar
#===============================================================================
class Progress_Bar
  
  #----------------------------------------------------------------------------
  # Constants
  #----------------------------------------------------------------------------
  Gauge_Width = 100
  Gauge_Height = 6
  Animation_Time = [1, GTBS::STAT_ANIM_TIME].max
  Gauge_Font_Size = Font.default_size
  Gauge_Gradient_Style = 1  #vertical gradient
  Gauge_Opacity = 200
  #----------------------------------------------------------------------------
  # * Object Intialization
  #    
  #----------------------------------------------------------------------------
  def initialize(window,ox, oy)
    @width            = Gauge_Width
    @height           = Gauge_Height
    @window = window
    @offset = @window.line_height - 8
    @ox, @oy = ox, oy+@offset
    @rect = Rect.new(@ox, @oy, Gauge_Width, Gauge_Height)
    @current, @max    = 0,100
    @current2, @max2  = 0,100
    @animation_count  = 0
    @storage          = []
    resize_fill 
  end
    
  #----------------------------------------------------------------------------
  # Get bitmap, keep the link if the window is resize or other
  #----------------------------------------------------------------------------
  def bitmap
    @window.contents
  end
  
  #----------------------------------------------------------------------------
  # * refresh 
  #----------------------------------------------------------------------------
  def refresh(current = @current, max = @max)
    if !animating?
      @current2 = current
      @max2 = max
      if @current != @current2   or  @max != @max2
        @animation_count = Animation_Time
        resize_fill
      end
    else
      abort_current_animation
      @storage.push [current, max]
    end
    update
  end
  #----------------------------------------------------------------------------
  # Abort Current Animation - Aborts animation in favor of current request
  #----------------------------------------------------------------------------
  def abort_current_animation
    @animation_count = 1
  end
  #----------------------------------------------------------------------------
  # * animating? 
  #----------------------------------------------------------------------------
  def animating?
    return @animation_count > 0
  end
  
  #----------------------------------------------------------------------------
  # * calculate_fill_perc 
  #----------------------------------------------------------------------------
  def calculate_fill_perc(current, max)
    return 0 if max == 0
    return 1.0 if max == nil
    return current.to_f/max
  end
  
  #----------------------------------------------------------------------------
  # * resize_fill 
  #----------------------------------------------------------------------------
  def resize_fill
    @old_perc = calculate_fill_perc(@current, @max)
    @new_perc = calculate_fill_perc(@current2, @max2)
    @rate = 1 if @max == nil or @max2 == nil
    @rate = (@new_perc-@old_perc)/Animation_Time
  end
  
  #----------------------------------------------------------------------------
  # * update 
  #----------------------------------------------------------------------------
  def update
    if animating?
      @animation_count -= 1
      self.fill(@old_perc + (@rate*(Animation_Time-@animation_count)))
      if @animation_count == 0
        update_current_info
      end
    elsif @storage.size > 0
      current, max = @storage.shift
      refresh(current, max)
    end
  end
  
  #----------------------------------------------------------------------------
  # * update_current_info 
  #----------------------------------------------------------------------------
  def update_current_info
    @current, @min, @max = @current2, @min2, @max2
  end
  
  #----------------------------------------------------------------------------
  # * fill 
  #----------------------------------------------------------------------------
  def fill(rate)
    self.bitmap.font.size = Gauge_Font_Size
    self.bitmap.clear_rect(@ox, @oy-@offset, Gauge_Width, Gauge_Height+@offset)
    color1, color2 = @window.hp_gauge_color1, @window.hp_gauge_color2
    fill_perc = rate*@width
    if rate >= 1.0
      rate = 1
    end
    
    draw_back_gauge
    #make_inner gauge
    ox, oy = @rect.x, @rect.y
    data_gauge = Bitmap.new(@width, @height)
    if @fill_back.nil?
      @fill_back = fill_with_img(data_gauge)
    end
    data_gauge = @fill_back.clone
    self.bitmap.blt(ox, oy, data_gauge, Rect.new(0,0,(@width)*rate,@height), Gauge_Opacity)
    data_gauge.dispose
    set_text
  end   
  #----------------------------------------------------------------------------
  # Fill with img
  #----------------------------------------------------------------------------
  def fill_with_img(bmp)
    color1, color2 = @window.hp_gauge_color1, @window.hp_gauge_color2
    bmp.gradient_fill_rect(bmp.rect, color1, color2)
    return bmp
  end
  #----------------------------------------------------------------------------
  # Draw Back Guage
  #----------------------------------------------------------------------------
  def draw_back_gauge
    unless @back_gauge
      @back_gauge = Bitmap.new(Gauge_Width, Gauge_Height)
      #make_back - white
      @back_gauge.fill_rect(0,0,@width, @height, @window.gauge_back_color)
    end
    self.bitmap.blt(@rect.x, @rect.y, @back_gauge, @back_gauge.rect, Gauge_Opacity)
  end
  
  #----------------------------------------------------------------------------
  # * set_text 
  #----------------------------------------------------------------------------
  def set_text
    @window.change_color(@window.system_color)
    @window.draw_text(@ox, @oy-@offset, 30, 20, Vocab::hp_a)
    @window.draw_current_and_max_values(@ox, @oy-@offset, @width, @current2, @max2,
    self.hp_color, @window.normal_color)
  end

  #--------------------------------------------------------------------------
  # * Get HP Text Color
  #--------------------------------------------------------------------------
  def hp_color()
    return @window.knockout_color if @current2 == 0
    return @window.crisis_color if @current2 < @max2 / 2
    return @window.normal_color
  end
end
