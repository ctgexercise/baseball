require 'helper'

class TestMostImproved < Test::Unit::TestCase

  def test_can_calculate_most_improved
    p1a = build_season_stat(player_id: '1', team_id: 'OAK', league: 'AL', year: 2010, at_bats: 10, hits: 3)
    p1b = build_season_stat(player_id: '1', team_id: 'OAK', league: 'AL', year: 2011, at_bats: 10, hits: 4)
    p2a = build_season_stat(player_id: '2', team_id: 'OAK', league: 'AL', year: 2010, at_bats: 10, hits: 2)
    p2b = build_season_stat(player_id: '2', team_id: 'OAK', league: 'AL', year: 2011, at_bats: 10, hits: 4)
    p3a = build_season_stat(player_id: '3', team_id: 'OAK', league: 'AL', year: 2010, at_bats: 5, hits: 0)
    p3b = build_season_stat(player_id: '3', team_id: 'OAK', league: 'AL', year: 2011, at_bats: 5, hits: 5)
    p4  = build_season_stat(player_id: '4', team_id: 'OAK', league: 'AL', year: 2010, at_bats: 5, hits: 5)

    player1 = build_player(player_id: '1', first_name: 'Foo', last_name: 'Bar', season_stats: [p1a, p1b])
    player2 = build_player(player_id: '2', first_name: 'Fizz', last_name: 'Fuzz', season_stats: [p2a, p2b])
    player3 = build_player(player_id: '3', first_name: 'Biz', last_name: 'Baz', season_stats: [p3a, p3b])
    player4 = build_player(player_id: '4', first_name: 'Diz', last_name: 'Daz', season_stats: [p4])

    players = Players.new
    [player1, player2, player3, player4].each {|p| players.add p}

    mi = MostImproved.new [p1a, p1b, p2a, p2b, p3a, p3b], players
    assert_equal player2,  mi.between(2010, 2011, 10)
  end

end