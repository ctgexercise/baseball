$:.unshift(File.expand_path('../../lib', __FILE__))

require 'baseball'
require 'csv'

stats_file = File.expand_path('../../resources/season_stats.csv', __FILE__)
players_file = File.expand_path('../../resources/players.csv', __FILE__)
season_stats = MlbCsvParser.season_stats_from stats_file
players = MlbCsvParser.players_from players_file, season_stats

mi = MostImproved.new season_stats, players
puts 'Most Improved batting average from 2009 to 2010'
puts mi.between(2009, 2010, min_at_bats = 200)
puts "\n\n"

sp = SluggingPercentages.new season_stats, players
puts "2007 Oakland A's slugging percentages"
puts sp.for_team 'OAK', 2007
puts "\n\n"

tc = TripleCrown.new season_stats, players
puts 'Triple Crown Winners'
[2011, 2012].each do |year|
  ['AL', 'NL'].each do |league|
    winner = tc.winner(year, league)
    puts "#{year} - #{league}: #{winner || '(no winner)'}"
  end
end