require 'helper'

class TestSeasonStat < Test::Unit::TestCase
  def test_can_calculate_batting_average
    assert_equal 0, build_season_stat(at_bats: 10).batting_average
    assert_equal 0, build_season_stat(at_bats: 0).batting_average
    assert_equal 0.2, build_season_stat(at_bats: 10, hits: 2).batting_average
  end

  def test_can_calculate_slugging_percentage
    assert_equal 0, build_season_stat(at_bats: 0).slugging_percentage
    assert_equal 0, build_season_stat(at_bats: 10, hits: 0).slugging_percentage
    assert_equal 0.2, build_season_stat(at_bats: 10, hits: 2).slugging_percentage
    assert_equal 0.2, build_season_stat(at_bats: 10, hits: 1, doubles: 1).slugging_percentage
    assert_equal 0.3, build_season_stat(at_bats: 10, hits: 1, triples: 1).slugging_percentage
    assert_equal 0.4, build_season_stat(at_bats: 10, hits: 1, home_runs: 1).slugging_percentage
  end

end