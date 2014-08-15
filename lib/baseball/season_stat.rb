class SeasonStat

  attr_reader :player_id, :year, :team_id, :league, :home_runs, :runs_batted_in, :at_bats

  def initialize player_id, year, league, team_id, at_bats, hits, doubles, triples, home_runs, runs_batted_in
    @player_id = player_id
    @year = year
    @league = league
    @team_id = team_id
    @at_bats = at_bats || 0
    @hits = hits || 0
    @doubles = doubles || 0
    @triples = triples || 0
    @home_runs = home_runs || 0
    @runs_batted_in = runs_batted_in || 0
  end

  def batting_average
    return 0.0 if @at_bats == 0
    @hits / @at_bats.to_f
  end

  def slugging_percentage
    return 0.0 if @at_bats == 0
    ((@hits - (@doubles + @triples + @home_runs)) +
        (2 * @doubles) +
        (3 * @triples) +
        (4 * @home_runs)) / @at_bats.to_f
  end
end