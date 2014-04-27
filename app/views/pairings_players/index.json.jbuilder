json.array!(@pairings_players) do |pairings_player|
  json.extract! pairings_player, :id, :pairing_id, :player_id
  json.url pairings_player_url(pairings_player, format: :json)
end
