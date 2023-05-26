%Q(
╔════╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═════╗
║ ╔══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╩═══╗ ║
╠─╣                             Enhanced Camera                              ╠─╣
╠─╣                           by RPG Maker Source.                           ╠─╣
╠─╣                          www.rpgmakersource.com                          ╠─╣
║ ╚══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╦═══╝ ║
╠════╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═╤═╩═════╣
║ ┌────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴─────┐ ║
╠─┤ Version 1.0.1                   13/12/14                        DD/MM/YY ├─╣
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
║ • Version 1.0.0, 08/12/14 - (DD/MM/YY).                                      ║
║                                                                              ║
║ • Version 1.0.1, 13/12/14 - (DD/MM/YY).                                      ║
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
║  This script greatly improves the appearence of your games. Once you see it  ║
║  in action, you will love it.                                                ║
║                                                                              ║
║  It makes the camera smoothly follow the player with a nice deceleration     ║
║  effect, and provides new functions that makes it more versatile.            ║
║                                                                              ║
║  Although it will work as soon as you insert it, we included some            ║
║  instructions in the next section for you to take advantage of some of the   ║
║  new features provided and to create awesome scenes and mechanics.           ║
║                                                                              ║
║  We hope you enjoy it.                                                       ║
║                                                                              ║
║  Thanks for choosing our products.                                           ║
║                                                                              ║
║ ┌──────────────────────────────────────────────────────────────────────────┐ ║
║ │ ■ Configuration.                                                         │ ║
║ └┬┬┬┬──────────────────────────────────────────────────────────────────┬┬┬┬┘ ║
║                                                                              ║
║  "How do I change the strength of the deceleration effect?"                  ║
║  Right click anywhere in the script editor and select "Find" (or CTRL + F)   ║
║  search for "Deceleration_Value" (without quotation marks).                  ║
║                                                                              ║
║  You will see something like "Deceleration_Value = 22"                       ║
║                                                                              ║
║  Set the number after the equality sign to any numer you like, bigger or     ║
║  equal than 1. The bigger the number, the stronger the deceleration effect   ║
║  and thus the slower the camera movement when following the player. Small    ║
║  numbers result in a faster deceleration, default value is 22.               ║
║                                                                              ║
║ ┌──────────────────────────────────────────────────────────────────────────┐ ║
║ │ ■ Feature Documentation.                                                 │ ║
║ └┬┬┬┬──────────────────────────────────────────────────────────────────┬┬┬┬┘ ║
║                                                                              ║
║  There are several commands that you can use inside a Script Call (Event     ║
║  Command) to create awesome scenes and mechanics. Although they are easy to  ║
║  use and understand, it is useful to have a reference to check in case you   ║
║  forget something about them.                                                ║
║                                                                              ║
║  The script commands that you can use inside a Script Call (Event Command)   ║
║  are displayed inside the following chart, followed by their description     ║
║  and, if needed, usage details and examples.                                 ║
║                                                                              ║
║  ┌───────────────────────────────┐                                           ║
║  │ ms_pro_cam_wait_for_scrolling │                                           ║
║  ├───────────────────────────────┴────────────────────────────────────────┐  ║
║  │ Waits until screen scrolling is completed before executing the next    │  ║
║  │ event command. This works for both the event command default scrolling │  ║
║  │ and for the new "scroll to position" (ms_pro_cam_center_at) function   │  ║
║  │ of Enhanced Camera.                                                    │  ║
║  └────────────────────────────────────────────────────────────────────────┘  ║
║  ┌────────────────────────────────────┐                                      ║
║  │ ms_pro_cam_center_at(x, y, frames) │                                      ║
║  ├────────────────────────────────────┴───────────────────────────────────┐  ║
║  │ Smoothly centers the camera at the desired coordinates in the exact    │  ║
║  │ desired number of frames.                                              │  ║
║  │                                                                        │  ║
║  │ In other words, this command allows you to tell the camera to move to  │  ║
║  │ a point, center the view on that point, and do so exactly in the time  │  ║
║  │ you desire.                                                            │  ║
║  │                                                                        │  ║
║  │ The speed of the camera movement is automatically adjusted to arrive   │  ║
║  │ at its destination exactly when its time is up.                        │  ║
║  │                                                                        │  ║
║  │ NOTE: Compatible with looped maps. Normally, if the camera is at the   │  ║
║  │ upper left corner of the map and you use this command to move it to    │  ║
║  │ ther lower right corner, the camera will go through the map center.    │  ║
║  │ But when you have horizontal, vertical or both loops in your maps, it  │  ║
║  │ will go through the shortest path, which in the case of the above      │  ║
║  │ example, is a short movement in the upper left direction (to just      │  ║
║  │ cross the map border). When you call ms_pro_cam_center_at, you have to │  ║
║  │ add three "parameters" to it, those parameters are x (target x         │  ║
║  │ position) y (target y position) and frames (time that the movement     │  ║
║  │ must take)                                                             │  ║
║  │                                                                        │  ║
║  │ As an example, if you want the camera to center at x44 y44 and to do   │  ║
║  │ so in 6 seconds (360 frames at normal 60FPS rate), you should use:     │  ║
║  │                                                                        │  ║
║  │ ms_pro_cam_center_at(44, 44, 360)                                      │  ║
║  └────────────────────────────────────────────────────────────────────────┘  ║
║  ┌───────────────────────────────────────┐                                   ║
║  │ ms_pro_cam_center_at_char(id, frames) │                                   ║
║  ├───────────────────────────────────────┴────────────────────────────────┐  ║
║  │ Similar as ms_pro_cam_center_at but instead of using an X and Y value, │  ║
║  │ uses an id of the character whose position is the target.              │  ║
║  │                                                                        │  ║
║  │ (*) What is "id"?                                                      │  ║
║  │ id is a number representing the character, -1 is for player, 0 for the │  ║
║  │ calling event and 1 and up for event id.                               │  ║
║  └────────────────────────────────────────────────────────────────────────┘  ║
║  ┌──────────────────────────────────────────┐                                ║
║  │ ms_pro_cam_focus_on(id, can_cancel, key) │                                ║
║  ├──────────────────────────────────────────┴─────────────────────────────┐  ║
║  │ Tells the camera to follow the desired character as if it would        │  ║
║  │ normally do for the player. In other words, tells the system to stop   │  ║
║  │ following the player and start following the desired character         │  ║
║  │ (determined by the parameter "id")                                     │  ║
║  │                                                                        │  ║
║  │ (*) What is "id"?                                                      │  ║
║  │ id is a number representing the character, -1 is for player, 0 for the │  ║
║  │ calling event and 1 and up for event id.                               │  ║
║  │                                                                        │  ║
║  │ As an example, if you want to focus the camera on an event and its ID  │  ║
║  │ is 22, use: ms_pro_cam_focus_on(22)                                    │  ║
║  │                                                                        │  ║
║  │ And if you later want to center it back to the player:                 │  ║
║  │ ms_pro_cam_focus_on(-1)                                                │  ║
║  │                                                                        │  ║
║  │ (*) What is "can_cancel"?                                              │  ║
║  │ can_cancel is either true or false and it is not necessary to include  │  ║
║  │ it in the command call unless you want the player to be able to focus  │  ║
║  │ the camera back on the playing character by pressing a key. Default is │  ║
║  │ false.                                                                 │  ║
║  │                                                                        │  ║
║  │ (*) What is "key"?                                                     │  ║
║  │ key is the symbol that represents the aforementioned key. It is not    │  ║
║  │ necessary to include it. Check RPG Maker Ace's help file for all the   │  ║
║  │ Input keys supported by the program. Keep in mind that if you use a    │  ║
║  │ custom or expanded input module (script) you can use more keys.        │  ║
║  │ Default is :CTRL (CONTROL) key (always put a double colon before the   │  ║
║  │ name of the key).                                                      │  ║
║  │                                                                        │  ║
║  │ This are the keys supported by default in Ace:                         │  ║
║  │                                                                        │  ║
║  │ :DOWN :LEFT :RIGHT :UP (Arrow Keys)                                    │  ║
║  │ :A :B :C :X :Y :Z :L :R (These do no represent keyboard letters)       │  ║
║  │ :SHIFT :CTRL :ALT                                                      │  ║
║  │ :F5 :F6 :F7 :F8 :F9                                                    │  ║
║  └────────────────────────────────────────────────────────────────────────┘  ║
║  ┌─────────────────────────────────────┐                                     ║
║  │ ms_pro_cam_character_on_screen?(id) │                                     ║
║  ├─────────────────────────────────────┴──────────────────────────────────┐  ║
║  │ Checks if character is visible on screen.                              │  ║
║  │                                                                        │  ║
║  │ This one is a slightly different than the others, since it will return │  ║
║  │ either true or false, you could use it in an Event Conditional Branch  │  ║
║  │ Command, fourth tab, last option (Script). You simply insert the       │  ║
║  │ command with the desired id that represents the character to check,    │  ║
║  │ and it will act as a normal conditional branch.                        │  ║
║  │                                                                        │  ║
║  │ Why would you want to use something like that? Imagine the player has  │  ║
║  │ to chase a thief down the street, you could center the camera at the   │  ║
║  │ running thief and tell the player to chase it closely or otherwise the │  ║
║  │ thief will run away. You can use this command to check if the player   │  ║
║  │ is "keeping up", if the player is not visible on screen, the thief     │  ║
║  │ escaped.                                                               │  ║
║  │                                                                        │  ║
║  │ This is just one example, you can use it for any mechanic that you can │  ║
║  │ think of.                                                              │  ║
║  │                                                                        │  ║
║  │ The "id" parameter works exactly like described above.                 │  ║
║  └────────────────────────────────────────────────────────────────────────┘  ║
║  ┌──────────────────────┐                                                    ║
║  │ ms_pro_cam_reset_str │                                                    ║
║  ├──────────────────────┴─────────────────────────────────────────────────┐  ║
║  │ Sets the deceleration strength to the number defined in                │  ║
║  │ Deceleration_Value.                                                    │  ║
║  │                                                                        │  ║
║  │ You can use this command to set back the deceleration strength to its  │  ║
║  │ default value. This affects only the "following" feature of the        │  ║
║  │ camera, like normal player focus/following and event focus/following.  │  ║
║  └────────────────────────────────────────────────────────────────────────┘  ║
║  ┌───────────────────────┐                                                   ║
║  │ ms_pro_cam_str(value) │                                                   ║
║  ├───────────────────────┴────────────────────────────────────────────────┐  ║
║  │ Sets the deceleration strength to the desired value.                   │  ║
║  │                                                                        │  ║
║  │ This command sets the deceleration strength of the focus/following     │  ║
║  │ feature of the camera to any number you insert as the "value"          │  ║
║  │ parameter.                                                             │  ║
║  │                                                                        │  ║
║  │ Keep in mind that the lower the number, the faster the camera will     │  ║
║  │ focus/follow (1 will result in something similar to RPG Maker Ace's    │  ║
║  │ default) and the bigger the number, the stronger the deceleration and  │  ║
║  │ thus the slower the speed.                                             │  ║
║  │                                                                        │  ║
║  │ You can use ms_pro_cam_reset_str, described above, to reset back the   │  ║
║  │ strength to its default setting.                                       │  ║
║  └────────────────────────────────────────────────────────────────────────┘  ║
║  ┌──────────────────────────────────────┐                                    ║
║  │ ms_pro_cam_ignore_player(true/false) │                                    ║
║  ├──────────────────────────────────────┴─────────────────────────────────┐  ║
║  │ If set to true, it won't follow the player, but it will scroll as      │  ║
║  │ usual when using scroll event commands or when using                   │  ║
║  │ ms_pro_cam_center_at.                                                  │  ║
║  │ If set to false, it will follow the player as usual when neeeded.      │  ║
║  │                                                                        │  ║
║  │ Why would you want to use it?                                          │  ║
║  │ In case you want to make some camera movement across the map without   │  ║
║  │ focusing on any particular character, and you don't want the camera to │  ║
║  │ jump back to the player as soon as the scrolling is finished and the   │  ║
║  │ player moves.                                                          │  ║
║  │                                                                        │  ║
║  │ By having this set to true (and thus "ignoring" the player) the camera │  ║
║  │ can be set still (it can be moving too) to any map location and it     │  ║
║  │ won't focus back on the player even if the player is moving.           │  ║
║  │                                                                        │  ║
║  │ Use true to ignore the player and false to acknowledge it back.        │  ║
║  └────────────────────────────────────────────────────────────────────────┘  ║
║  ┌────────────────────────┐                                                  ║
║  │ ms_pro_cam_lock_camera │                                                  ║
║  ├────────────────────────┴───────────────────────────────────────────────┐  ║
║  │ Prevents the camera movement until ms_pro_cam_unlock_camera is called. │  ║
║  │                                                                        │  ║
║  │ This one is pretty simple, when you call it, the camera won't move     │  ║
║  │ anymore until you "unlock" it again. Nothing will move it, not even    │  ║
║  │ zombie vampires.                                                       │  ║
║  │                                                                        │  ║
║  │ Keep in mind that the player can still move freely and everything will │  ║
║  │ work as usual.                                                         │  ║
║  └────────────────────────────────────────────────────────────────────────┘  ║
║  ┌──────────────────────────┐                                                ║
║  │ ms_pro_cam_unlock_camera │                                                ║
║  ├──────────────────────────┴─────────────────────────────────────────────┐  ║
║  │ Allows normal camera movement.                                         │  ║
║  │                                                                        │  ║
║  │ This one is to reverse the locking caused by the above command. The    │  ║
║  │ camera will "go back to life" and perform as usual.                    │  ║
║  └────────────────────────────────────────────────────────────────────────┘  ║
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
# ** Maker Systems
#------------------------------------------------------------------------------
#  Module for our Systems.
#==============================================================================

module MakerSystems
  
  #============================================================================
  # ** Enhanced Camera
  #----------------------------------------------------------------------------
  #  Contains configurable values for the camera systems.
  #============================================================================
  
  module EnhancedCamera
    
    #------------------------------------------------------------------------
    # * Scrolling Deceleration Strength.                                [OPT]
    #------------------------------------------------------------------------
    Deceleration_Value = 15
    
  end
  
end

#==============================================================================
# ** Game_Interpreter
#------------------------------------------------------------------------------
#  Added methods to use in Script Call Event Command.
#==============================================================================

class Game_Interpreter
  
  #--------------------------------------------------------------------------
  # * Reset Deceleration Strength.                                      [NEW]
  #--------------------------------------------------------------------------
  def ms_pro_cam_reset_str
    # Set camera deceleration strength back to default.
    $game_map.ms_ecam_str = 
    MakerSystems::EnhancedCamera::Deceleration_Value.to_f
  end
  #--------------------------------------------------------------------------
  # * Deceleration Strength.                                            [NEW]
  #--------------------------------------------------------------------------
  def ms_pro_cam_str(value)
    # Set camera deceleration strength.
    $game_map.ms_ecam_str = value.to_f
  end
  #--------------------------------------------------------------------------
  # * Ignore Player Toggle.                                             [NEW]
  #--------------------------------------------------------------------------
  def ms_pro_cam_ignore_player(value)
    # Set ignore player flag.
    $game_map.ms_ecam_ignore_player = value
  end
  #--------------------------------------------------------------------------
  # * Lock Camera.                                                      [NEW]
  #--------------------------------------------------------------------------
  def ms_pro_cam_lock_camera
    # Turns on camera lock flag.
    $game_map.ms_ecam_locked = true
  end
  #--------------------------------------------------------------------------
  # * Unlock Camera.                                                    [NEW]
  #--------------------------------------------------------------------------
  def ms_pro_cam_unlock_camera
    # Turns off camera lock flag.
    $game_map.ms_ecam_locked = false
  end
  #--------------------------------------------------------------------------
  # * Character on Screen?                                              [NEW]
  #--------------------------------------------------------------------------
  def ms_pro_cam_character_on_screen?(id)
    # Get character based on provided number (id).
    character = get_character(id)
    # Inside screen boundaries?
    character.screen_x > 0 && character.screen_x < Graphics.width &&
    character.screen_y > 0 && character.screen_y < Graphics.height
  end
  #--------------------------------------------------------------------------
  # * Focus on Character.                                               [NEW]
  #--------------------------------------------------------------------------
  def ms_pro_cam_focus_on(id, can_cancel = false, key = :CTRL)
    # Get character based on provided number (id).
    character = get_character(id)
    # Special handling if Player is the target.
    if character.is_a?(Game_Player)
      # Clears special character focus variable.
      $game_map.ms_ecam_target        = nil
      # Turns off ignore player flag.
      $game_map.ms_ecam_ignore_player = false
      # Moves camera back to player.
      $game_map.ms_ecam_center(character.real_x, character.real_y)
    else
      # Sets camera target to its new target character.
      $game_map.ms_ecam_target      = character
      # Sets cancel focus flag.
      $game_map.ms_ecam_cancel     = can_cancel
      # Sets cancel focus key.
      $game_map.ms_ecam_cancel_key = key
    end
  end
  #--------------------------------------------------------------------------
  # * Wait for Scrolling.                                               [NEW]
  #--------------------------------------------------------------------------
  def ms_pro_cam_wait_for_scrolling
    # Yield until scrolling is completed.
    Fiber.yield while $game_map.scrolling? || $game_map.ms_ecam_iterations
  end
  #--------------------------------------------------------------------------
  # * Center Camera at Position.                                        [NEW]
  #--------------------------------------------------------------------------
  def ms_pro_cam_center_at(x, y, frames)
    # Set camera location target.
    $game_map.ms_ecam_go_to(x, y, frames)
  end
  #--------------------------------------------------------------------------
  # * Center Camera at Character.                                       [NEW]
  #--------------------------------------------------------------------------
  def ms_pro_cam_center_at_char(id, frames)
    # Get character based on provided number (id).
    character = get_character(id)
    # Set camera location target.
    $game_map.ms_ecam_go_to(character.x, character.y, frames)
  end
  
end

#==============================================================================
# ** Game_Map
#------------------------------------------------------------------------------
#  Edited update_scroll and initialize.
#==============================================================================

class Game_Map
  
  #--------------------------------------------------------------------------
  # * Public Instance Variables.                                        [NEW]
  #--------------------------------------------------------------------------
  attr_accessor :ms_ecam_target, :ms_ecam_iterations, :ms_ecam_str,
                :ms_ecam_ignore_player, :ms_ecam_locked, :ms_ecam_cancel,
                :ms_ecam_cancel_key
  #--------------------------------------------------------------------------
  # * Alias Initialize.                                                 [NEW]
  #--------------------------------------------------------------------------
  alias_method(:ms_ecam_original_initialize, :initialize)
  #--------------------------------------------------------------------------
  # * Initialize.                                                       [MOD]
  #--------------------------------------------------------------------------
  def initialize
    # Original method.
    ms_ecam_original_initialize
    # Initializes deceleration strength.
    @ms_ecam_str = MakerSystems::EnhancedCamera::Deceleration_Value.to_f
  end
  #--------------------------------------------------------------------------
  # * Center Position.                                                  [NEW]
  #--------------------------------------------------------------------------
  def ms_ecam_center(target_real_x, target_real_y, hard = false)
    # Target position, centered.
    @ms_ecam_real_x = target_real_x - screen_tile_x / 2
    @ms_ecam_real_y = target_real_y - screen_tile_y / 2
    # Position correction for no horizontally looped maps.
    unless loop_horizontal?
      # Limit for the X axis.
      limit_x  = width  - screen_tile_x
      limit_x  = 0 if limit_x < 0
      # Keeps target position inside correct boundaries.
      @ms_ecam_real_x = 0       if @ms_ecam_real_x < 0
      @ms_ecam_real_x = limit_x if @ms_ecam_real_x > limit_x
    end
    # Position correction for no vertically looped maps.
    unless loop_vertical?
      # Limit for the Y axis.
      limit_y  = height - screen_tile_y
      limit_y  = 0 if limit_y < 0
      # Keeps target position inside correct boundaries.
      @ms_ecam_real_y = 0       if @ms_ecam_real_y < 0
      @ms_ecam_real_y = limit_y if @ms_ecam_real_y > limit_y
    end
    # Ensures correct target values in case of looping any axis.
    @ms_ecam_real_x %= width
    @ms_ecam_real_y %= height
    # No smooth movement?
    if hard
      # Sets display position now, without any smooth deceleration effect.
      @display_x = @ms_ecam_real_x
      @display_y = @ms_ecam_real_y
    end
  end
  #--------------------------------------------------------------------------
  # * Prepares Camera Target.                                           [NEW]
  #--------------------------------------------------------------------------
  def ms_ecam_go_to(target_x, target_y, period = 60.0)
    # Prevents execution of any kind of camera movement if locked flag is on.
    return if @ms_ecam_locked
    # Sets correct target positions.
    ms_ecam_center(target_x, target_y)
    # Gets correct X distance.
    @ms_ecam_x_amplitude = ms_ecam_correct_amplitude(@display_x,
                                   @ms_ecam_real_x, width, loop_horizontal?)
    # Gets correct Y distance.
    @ms_ecam_y_amplitude = ms_ecam_correct_amplitude(@display_y,
                                    @ms_ecam_real_y, height, loop_vertical?)
    # Initializes iteration counter.
    @ms_ecam_iterations = 0.0
    # Saves the original, starting position.
    @ms_ecam_x_original = @display_x
    @ms_ecam_y_original = @display_y
    # Sets period (time).
    @ms_ecam_period = period.to_f
  end
  #--------------------------------------------------------------------------
  # * Correct Amplitude.                                                [NEW]
  #--------------------------------------------------------------------------
  def ms_ecam_correct_amplitude(current, target, limit, condition)
    # Checks if looping in the desired axis.
    if condition
      # Returns shortest distance, crossing map borders if needed.
      if ((target - current) % limit) < ((current - target) % limit)
        (target - current) % limit
      else
        -((current - target) % limit)
      end
    else
      # Returns normal distance.
      target - current
    end
  end
  #--------------------------------------------------------------------------
  # * Alias Update Scroll.                                              [NEW]
  #--------------------------------------------------------------------------
  alias_method(:ms_ecam_original_update_scroll, :update_scroll)
  #--------------------------------------------------------------------------
  # * Update Scroll.                                                    [MOD]
  #--------------------------------------------------------------------------
  def update_scroll
    # Prevents execution of any kind of camera movement if locked flag is on.
    return if @ms_ecam_locked
    # If non player target for camera.
    if @ms_ecam_target
      # If can be cancelled by player input and the key is triggered.
      if @ms_ecam_cancel && Input.trigger?(@ms_ecam_cancel_key)
        # Clears target flag.
        @ms_ecam_target = nil
        # Moves camera back to player.
        ms_ecam_center($game_player.real_x, $game_player.real_y)
      else
        # Centers camera on target.
        ms_ecam_center(@ms_ecam_target.real_x, @ms_ecam_target.real_y, false)
      end
    end
    # Iterations pending?
    if @ms_ecam_iterations 
      # Calculates period.
      period = (@ms_ecam_iterations / @ms_ecam_period) * 1.57
      # Sets new display positions.
      @display_x = @ms_ecam_x_original + @ms_ecam_x_amplitude * Math.sin(period)
      @display_y = @ms_ecam_y_original + @ms_ecam_y_amplitude * Math.sin(period)
      # Ensures correct display values.
      @display_x %= $game_map.width
      @display_y %= $game_map.height
      # If target positions were reached.
      if period == 1.57
        # Sets target position flag off.
        @ms_ecam_iterations = nil
        # Updates target positions.
        @ms_ecam_real_x = @display_x
        @ms_ecam_real_y = @display_y
      else
        # Updates iteration count.
        @ms_ecam_iterations += 1.0
      end
    else
      # Camera being moved by event commands?
      if scrolling?
        # Target position is actual display position.
        @ms_ecam_real_x = @display_x
        @ms_ecam_real_y = @display_y
      else
        # Moves camera. Correct step value with deceleration effect. X Axis.
        @display_x += ms_ecam_correct_amplitude(@display_x,
        @ms_ecam_real_x, width, loop_horizontal?) / @ms_ecam_str
        # Moves camera. Correct step value with deceleration effect. Y Axis.
        @display_y += ms_ecam_correct_amplitude(@display_y,
        @ms_ecam_real_y, height, loop_vertical?)  / @ms_ecam_str
        # Keeps map display values inside correct boundaries.
        @display_x %= width
        @display_y %= height
      end
    end
    # Original method.
    ms_ecam_original_update_scroll
  end
  
end

#==============================================================================
# ** Game_Player
#------------------------------------------------------------------------------
#  Replaced update_scroll and center.
#==============================================================================

class Game_Player < Game_Character
  
  #--------------------------------------------------------------------------
  # * Update Scroll.                                                    [REP]
  #--------------------------------------------------------------------------
  def update_scroll(last_real_x, last_real_y)
    # Check if it is good to go.
    unless $game_map.ms_ecam_target        || $game_map.ms_ecam_iterations ||
           $game_map.ms_ecam_ignore_player || !moving?
      # Updates the camera centering.
      $game_map.ms_ecam_center(@real_x, @real_y)
    end
  end
  #--------------------------------------------------------------------------
  # * Center.                                                           [REP]
  #--------------------------------------------------------------------------
  def center(x, y)
    # Don't center if the camera is anchored to its position.
    return if $game_map.ms_ecam_locked
    # Center camera display position at once.
    $game_map.ms_ecam_center(x.to_f, y.to_f, true)
  end
  
end