%Q(
╔════╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═════╗
║ ╔══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╗ ║
╠─╣                              Smooth Cursor                               ╠─╣
╠─╣                           by RPG Maker Source.                           ╠─╣
╠─╣                          www.rpgmakersource.com                          ╠─╣
║ ╚══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╝ ║
╠════╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═════╣
║ ┌────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴─────┐ ║
╠─┤ Version 1.0.4                   24/05/15                        DD/MM/YY ├─╣
║ └────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬─────┘ ║
╠══════╧═══╧═══╧═══╧═══╧═══╧═══╧═══╧═══╧═══╧═══╧═══╧═══╧═══╧═══╧═══╧═══╧═══════╣
║                                                                              ║
║               This work is protected by the following license:               ║
║     ╔══════════════════════════════════════════════════════════════════╗     ║
║     │                                                                  │     ║
║     │ Copyright © 2014 Maker Systems.                                  │     ║
║     │                                                                  │     ║
║     │ This software is provided 'as-is', without any kind of           │     ║
║     │ warranty. Under no circumstances will the author be held         │     ║
║     │ liable for any damages arising from the use of this software.    │     ║
║     │                                                                  │     ║
║     │ Permission is granted to anyone to use this software on their    │     ║
║     │ free or commercial games made with a legal copy of RPG Maker     │     ║
║     │ VX Ace, as long as Maker Systems - RPG Maker Source is           │     ║
║     │ credited within the game.                                        │     ║
║     │                                                                  │     ║
║     │ Selling this code or any portions of it 'as-is' or as part of    │     ║
║     │ another code, is not allowed.                                    │     ║
║     │                                                                  │     ║
║     │ The original header, which includes this copyright notice,       │     ║
║     │ must not be edited or removed from any verbatim copy of the      │     ║
║     │ sotware nor from any edited version.                             │     ║
║     │                                                                  │     ║
║     ╚══════════════════════════════════════════════════════════════════╝     ║
║                                                                              ║
║                                                                              ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ 1. VERSION HISTORY.                                                        ▼ ║
╠══════════════════════════════════════════════════════════════════════════════╣
║                                                                              ║
║ • Version 1.0.0, 24/11/14 - (DD/MM/YY).                                      ║
║                                                                              ║
║ • Version 1.0.1, 30/11/14 - (DD/MM/YY).                                      ║
║                                                                              ║
║ • Version 1.0.2, 17/12/14 - (DD/MM/YY).                                      ║
║                                                                              ║
║ • Version 1.0.3, 30/03/15 - (DD/MM/YY).                                      ║
║                                                                              ║
║ • Version 1.0.4, 24/05/15 - (DD/MM/YY).                                      ║
║                                                                              ║
╠══════════════════════════════════════════════════════════════════════════════╣
╠══════════════════════════════════════════════════════════════════════════════╣
║ 2. USER MANUAL.                                                            ▼ ║
╠══════════════════════════════════════════════════════════════════════════════╣
║                                                                              ║
║ ┌──────────────────────────────────────────────────────────────────────────┐ ║
║ │ ■ Introduction.                                                          │ ║
║ └┬┬┬┬──────────────────────────────────────────────────────────────────┬┬┬┬┘ ║
║                                                                              ║
║  Hello there! This script is "plug and play", you can simply insert it into  ║
║  your project and it will perform flawlessly.                                ║
║                                                                              ║
║  This script embellishes your GUIs by changing the way the default Window    ║
║  cursor works in RPG Maker VX Ace. The cursor will smoothly move to its new  ║
║  position when selecting items and will also smoothly change its size when   ║
║  needed.                                                                     ║
║                                                                              ║
║  The scrolling of the window contents will also be smooth.                   ║
║                                                                              ║
║  We hope you enjoy it.                                                       ║
║                                                                              ║
║  Thanks for choosing our products.                                           ║
║                                                                              ║
║ ┌──────────────────────────────────────────────────────────────────────────┐ ║
║ │ ■ Configuration.                                                         │ ║
║ └┬┬┬┬──────────────────────────────────────────────────────────────────┬┬┬┬┘ ║
║                                                                              ║
║  "How do I change the speed of the cursor movement?"                         ║
║  Right click anywhere in the script editor and select "Find" (or CTRL + F)   ║
║  search for "DELAY_LEVEL" (without quotation marks).                         ║
║                                                                              ║
║  You will see something like "DELAY_LEVEL = 4"                               ║
║                                                                              ║
║  Set the number after the equality sign to any numer you like, bigger or     ║
║  equal than 1. The bigger the number, the stronger the deceleration effect   ║
║  and thus the slower the cursor speed when changing selections (or           ║
║  dimensions). Small numbers result in a faster deceleration, default value   ║
║  is 4.                                                                       ║
║                                                                              ║
║                                                                              ║
╠══════════════════════════════════════════════════════════════════════════════╣
╠══════════════════════════════════════════════════════════════════════════════╣
║ 3. NOTES.                                                                  ▼ ║
╠══════════════════════════════════════════════════════════════════════════════╣
║                                                                              ║
║  Have fun and enjoy!                                                         ║
║                                                                              ║
╠══════════════════════════════════════════════════════════════════════════════╣
╠══════════════════════════════════════════════════════════════════════════════╣
║ 4. CONTACT.                                                                ▼ ║
╠══════════════════════════════════════════════════════════════════════════════╣
║                                                                              ║
║  Keep in touch with us and be the first to know about new releases:          ║
║                                                                              ║
║  www.rpgmakersource.com                                                      ║
║  www.facebook.com/RPGMakerSource                                             ║
║  www.twitter.com/RPGMakerSource                                              ║
║  www.youtube.com/user/RPGMakerSource                                         ║
║                                                                              ║
║  Get involved! Have an idea for a system? Let us know.                       ║
║                                                                              ║
║  Spread the word and help us reach more people so we can continue creating   ║
║  awesome resources for you!                                                  ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝)
 
#==============================================================================
# ** MakerSystems
#------------------------------------------------------------------------------
#  Module for our Systems.
#==============================================================================
 
module MakerSystems
 
  #============================================================================
  # ** SmoothCursor
  #----------------------------------------------------------------------------
  #  Module for Smooth Cursor.
  #============================================================================
 
  module SmoothCursor
   
    #------------------------------------------------------------------------
    # * Low values yield a fast effect.                                 [OPT]
    #------------------------------------------------------------------------
    DELAY_LEVEL = 4
   
  end
 
end
 
#==============================================================================
# ** Window_Selectable
#------------------------------------------------------------------------------
#  Alias to Update. Update Cursor Replaced. Added method to handle the effect.
#==============================================================================
 
class Window_Selectable < Window_Base
 
  #--------------------------------------------------------------------------
  # * Update Alias                                                      [NEW]
  #--------------------------------------------------------------------------
  alias_method(:ms_smooth_cursor_original_update, :update)
  #--------------------------------------------------------------------------
  # * Update                                                            [MOD]
  #--------------------------------------------------------------------------
  def update
    # Original method.
    ms_smooth_cursor_original_update
    # Stop unless cursor update is needed.
    return unless @ms_smooth_cursor_target && self.index >= 0 && !disposed?
    # Update smooth cursor features.
    ms_smooth_cursor_update
  end
  #--------------------------------------------------------------------------
  # * Smooth Cursor Update                                              [NEW]
  #--------------------------------------------------------------------------
  def ms_smooth_cursor_update
    # Current Rect.
    now = cursor_rect
    # Get the target Rect.
    target = @ms_smooth_cursor_target[0]
    # Get the target Offset Y.
    target_oy = @ms_smooth_cursor_target[1]
    # Shortcut to desired delay.
    delay = MakerSystems::SmoothCursor::DELAY_LEVEL.to_f
    # Calculates and applies step value for X.
    step = ((target.x - now.x).to_f / delay)
    now.x += target.x > now.x                ? step.ceil : step.floor
    # Calculates and applies step value for Y.
    step = ((target.y - now.y).to_f / delay)
    now.y += target.y > now.y                ? step.ceil : step.floor
    # Calculates and applies step value for Width.
    step = ((target.width - now.width).to_f / delay)
    now.width += target.width > now.width    ? step.ceil : step.floor
    # Calculates and applies step value for Height.
    step = ((target.height - now.height).to_f / delay)
    now.height += target.height > now.height ? step.ceil : step.floor
    if self.respond_to?(:visible_line_number) && visible_line_number == 1
      # Calculates and applies step value for Offset Y.
      step = ((target_oy - self.ox).to_f / delay)
      self.ox += target_oy > self.ox ? step.ceil : step.floor
      # If targets reached, stop ms_smooth_cursor_update.
      if cursor_rect == target && self.ox == target_oy
        @ms_smooth_cursor_target = nil
      end
    else
      # Calculates and applies step value for Offset Y.
      step = ((target_oy - self.oy).to_f / delay)
      self.oy += target_oy > self.oy ? step.ceil : step.floor
      # If targets reached, stop ms_smooth_cursor_update.
      if cursor_rect == target && self.oy == target_oy
        @ms_smooth_cursor_target = nil
      end
    end
  end
 
  #--------------------------------------------------------------------------
  # * Top Col (HorzCommand),                                            [NEW]
  #--------------------------------------------------------------------------
  def ms_smooth_cursor_hrzcommand_top_col=(col)
    col = 0 if col < 0
    @ms_smooth_cursor_target_ox = col * (item_width + spacing)
  end
  #--------------------------------------------------------------------------
  # * Bottom Col (HorzCommand).                                         [NEW]
  #--------------------------------------------------------------------------
  def ms_smooth_cursor_hrzcommand_bottom_col=(col)
    self.ms_smooth_cursor_hrzcommand_top_col = col - (col_max - 1)
  end
  #--------------------------------------------------------------------------
  # * Ensure Cursor Visible (HorzCommand).                              [NEW]
  #--------------------------------------------------------------------------
  def ms_smooth_cursor_hrzcommand_ensure_cursor_visible
    self.ms_smooth_cursor_hrzcommand_top_col    = index if index < top_col
    self.ms_smooth_cursor_hrzcommand_bottom_col = index if index > bottom_col
  end
  #--------------------------------------------------------------------------
  # * Update Cursor.                                                    [REP]
  #--------------------------------------------------------------------------
  def update_cursor
    if @cursor_all
      cursor_rect.set(0, 0, contents.width, row_max * item_height)
      self.top_row = 0
    elsif @index < 0
      cursor_rect.empty
    else
      if self.respond_to?(:visible_line_number) && visible_line_number == 1 &&
        self.respond_to?(:top_col)
        # Special case for HorzCommand window or any horizontally extended one.
        ms_target_oy = self.ox
        ms_smooth_cursor_hrzcommand_ensure_cursor_visible
        if @ms_smooth_cursor_target_ox
          ms_target_oy = @ms_smooth_cursor_target_ox
        end
      else
        # Manages Offset Y as in ensure_cursor_visible but instead of using
        # top_row to set the value, passes it to ms_smooth_cursor_update.
        ms_target_oy = self.oy
        if row < top_row || row > bottom_row
          msrow = row
          msrow = msrow - (page_row_max - 1) if row > bottom_row
          msrow = 0                          if msrow < 0
          msrow = row_max - 1                if msrow > row_max - 1
          ms_target_oy = msrow * item_height
        end
      end
      # New targets.
      @ms_smooth_cursor_target = [item_rect(@index), ms_target_oy]
    end
  end
 
end