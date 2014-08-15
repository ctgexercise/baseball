require 'helper'

class TestPlayer < Test::Unit::TestCase
  def test_can_detect_if_played_in_year
    stat = build_season_stat at_bats: 10
    player = build_player season_stats: [stat]
    assert player.played_in?(2011)
    refute player.played_in?(2010)
    refute player.played_in?(2011, 20)
  end
end