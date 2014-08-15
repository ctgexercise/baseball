class Player

  attr_reader :player_id, :birth_year

  def initialize player_id, first_name, last_name, birth_year, season_stats
    @player_id = player_id
    @first_name = first_name
    @last_name = last_name
    @birth_year = birth_year
    @season_stats_by_year = season_stats.inject({}) { |sby, s| sby[s.year] = s; sby }
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def played_in? year, min_at_bats = 0
    stats = @season_stats_by_year[year]
    return false unless stats
    stats.at_bats >= min_at_bats
  end

  def batting_average year
    stats = @season_stats_by_year[year]
    stats ? stats.batting_average : nil
  end

  def to_s; name end

end