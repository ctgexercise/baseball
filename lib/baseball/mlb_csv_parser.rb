require 'csv'

class MlbCsvParser
  PARSE_OPTIONS = { headers: true,
                    header_converters: :symbol,
                    converters: :numeric }
  class << self
    def season_stats_from file
      season_stats = []
      CSV.foreach(file, PARSE_OPTIONS) do |row|
        season_stats << SeasonStat.new(row[:playerid],
                                       row[:yearid],
                                       row[:league],
                                       row[:teamid],
                                       row[:ab],
                                       row[:h],
                                       row[:'2b'],
                                       row[:'3b'],
                                       row[:hr],
                                       row[:rbi])
      end
      season_stats
    end

    def players_from file, season_stats
      stats_by_player_id = season_stats.group_by &:player_id
      players = Players.new
      CSV.foreach(file, PARSE_OPTIONS) do |row|
        player_id = row[:playerid]
        stats = stats_by_player_id[player_id] || []
        players.add Player.new(player_id,
                               row[:namefirst],
                               row[:namelast],
                               row[:birthyear],
                               stats)
      end
      players
    end
  end
end