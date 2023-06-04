class Scene_Battle_TBS
  #-------------------------------------------------------------
  # Result Phase
  #-------------------------------------------------------------
  def result_phase
    show_congrat
    make_result_info
    exit_battle
  end
  #----------------------------------------------------------------------------
  # Show Congratulations
  #----------------------------------------------------------------------------
  def show_congrat
    congrat = Congrat_Sprite.new(@battle_exiting)
    while not congrat.disposed?
      Graphics.update
      $game_map.update(false)
      @spriteset.update
      congrat.update
    end
  end
  #----------------------------------------------------------------
  # Call Battle Exit Command
  #----------------------------------------------------------------
  def exit_battle
    stay_in_last_location = false
    return_to_map, return_x, return_y, return_dir = GTBS::battle_exit_info(@map_id)
    if return_to_map.nil? || return_to_map == false || return_to_map == 0
      return_to_map = @map_id
      stay_in_last_location = true
    end
    $game_map.setup(return_to_map)
    for battler in SceneManager.scene.tactics_all
      battler.atb = nil
    end
    if stay_in_last_location
      $game_player.moveto($game_party.leader.real_x, $game_party.leader.real_y)
      $game_player.set_direction($game_party.leader.direction)
    else
      $game_player.moveto(return_x, return_y) if return_x != nil
      $game_player.set_direction(return_dir) if return_dir != nil
    end
    $game_party.clear_summons
    $game_party.clear_neutrals
    $game_troop.clear_summons
    @map_id = nil
    SceneManager.return
    $game_map.autoplay
    $game_player.refresh
    $game_player.center($game_player.x, $game_player.y)
    Graphics.freeze
    Graphics.fadeout(30)
  end
end