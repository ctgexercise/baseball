class Players

  def initialize
    @players_by_id = {}
  end

  def add player
    id = player.player_id
    return unless id
    # raise Exception.new("player already exists for #{id}") if @players_by_id[id]
    # can't raise because of bad data (duplicate player id baezda01), so choose most recent player instead
    existing = @players_by_id[id]
    return if existing && existing.birth_year > player.birth_year
    @players_by_id[id] = player
  end

  def for_id player_id
    @players_by_id[player_id].tap do |p|
      raise Exception.new("no player for #{player_id}") unless p
    end
  end

  def select &block
    @players_by_id.values.select &block
  end
end