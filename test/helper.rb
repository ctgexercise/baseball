require 'test/unit'
require 'baseball'

def build_player overrides
  defaults = {player_id: 'id',
              first_name: 'first',
              last_name: 'last',
              birth_year: 1970,
              season_stats: []}
  attributes = defaults.merge overrides
  Player.new attributes[:player_id],
             attributes[:first_name],
             attributes[:last_name],
             attributes[:birth_year],
             attributes[:season_stats]
end

def build_season_stat overrides
  defaults = {player_id: 'id',
              year: 2011,
              league: 'AL',
              team_id: 'OAK',
              at_bats: 0,
              hits: 0,
              doubles: 0,
              triples: 0,
              home_runs: 0,
              runs_batted_in: 0}
  attributes = defaults.merge overrides
  SeasonStat.new attributes[:player_id],
                 attributes[:year],
                 attributes[:league],
                 attributes[:team_id],
                 attributes[:at_bats],
                 attributes[:hits],
                 attributes[:doubles],
                 attributes[:triples],
                 attributes[:home_runs],
                 attributes[:runs_batted_in]
end