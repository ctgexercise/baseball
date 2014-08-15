class MostImproved < RecordCalculator
  def between start_year, end_year, min_at_bats
    raise Exception.new('end year must be greater than start year') unless end_year > start_year
    candidate_players = @players.select { |p| p.played_in?(start_year, min_at_bats) && p.played_in?(end_year, min_at_bats)}
    candidate_players.sort_by do |p|
      p.batting_average(end_year) - p.batting_average(start_year)
    end.last
  end
end