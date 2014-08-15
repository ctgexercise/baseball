class SluggingPercentages < RecordCalculator
  def for_team team, year
    @season_stats.select {|stat| stat.team_id == team && stat.year == year}.map do |stat|
      player = @players.for_id stat.player_id
      "#{player}: #{stat.slugging_percentage.round 3}"
    end.sort.join("\n")
  end
end