require 'helper'

class TestSlugginPercentages < Test::Unit::TestCase

  def test_can_calculate_slugging_percentage_for_team_and_year
    p1a = build_season_stat(player_id: '1', team_id: 'OAK', year: 2010, at_bats: 10, hits: 3)
    p1b = build_season_stat(player_id: '1', team_id: 'OAK', year: 2011, at_bats: 10, hits: 8)
    p2 =  build_season_stat(player_id: '2', team_id: 'SEA', year: 2010, at_bats: 10, hits: 5)
    p3 =  build_season_stat(player_id: '3', team_id: 'OAK', year: 2010, at_bats: 10, hits: 9)

    player1 = build_player(player_id: '1', first_name: 'Foo', last_name: 'Bar', season_stats: [p1a, p1b])
    player2 = build_player(player_id: '2', first_name: 'Fizz', last_name: 'Fuzz', season_stats: [p2])
    player3 = build_player(player_id: '3', first_name: 'Biz', last_name: 'Baz', season_stats: [p3])

    players = Players.new
    [player1, player2, player3].each {|p| players.add p}

    sp = SluggingPercentages.new [p1a, p1b, p2, p3], players
    assert_equal "Biz Baz: 0.9\nFoo Bar: 0.3", sp.for_team('OAK', 2010)
  end

end