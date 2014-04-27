json.array!(@pairings) do |pairing|
  json.extract! pairing, :id, :timeout, :lockdownScore
  json.url pairing_url(pairing, format: :json)
end
