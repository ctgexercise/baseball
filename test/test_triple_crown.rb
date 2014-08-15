require 'helper'

class TestTripleCrown < Test::Unit::TestCase

  def test_can_calculate_slugging_percentage
    p1a = build_season_stat(player_id: '1', team_id: 'OAK', league: 'AL', year: 2010, at_bats: 500, hits: 3)
    p1b = build_season_stat(player_id: '1', team_id: 'OAK', league: 'AL', year: 2011, at_bats: 500, hits: 9, home_runs: 2, runs_batted_in: 2)
    p2 =  build_season_stat(player_id: '2', team_id: 'SEA', league: 'NL', year: 2010, at_bats: 500, hits: 9, home_runs: 2, runs_batted_in: 2)
    p3 =  build_season_stat(player_id: '3', team_id: 'OAK', league: 'AL', year: 2010, at_bats: 500, hits: 8, home_runs: 1, runs_batted_in: 1)
    p4 =  build_season_stat(player_id: '2', team_id: 'SEA', league: 'NL', year: 2010, at_bats: 100, hits: 9, home_runs: 2, runs_batted_in: 2)

    player1 = build_player(player_id: '1', first_name: 'Foo', last_name: 'Bar', season_stats: [p1a, p1b])
    player2 = build_player(player_id: '2', first_name: 'Fizz', last_name: 'Fuzz', season_stats: [p2])
    player3 = build_player(player_id: '3', first_name: 'Biz', last_name: 'Baz', season_stats: [p3])

    players = Players.new
    [player1, player2, player3].each {|p| players.add p}

    tc = TripleCrown.new [p1a, p1b, p2, p3, p4], players
    assert_equal player3, tc.winner(2010, 'AL')
  end

end