class TripleCrown < RecordCalculator
  def winner year, league
    stats = @season_stats.select {|s| s.year == year && s.league == league && s.at_bats >= 400}

    player_ids = [:batting_average, :home_runs, :runs_batted_in].map do |stat_name|
      stats.sort_by(&stat_name).last.player_id
    end.uniq

    if player_ids.count == 1
      winning_player_id = player_ids.first
      @players.for_id winning_player_id
    end
  end
end