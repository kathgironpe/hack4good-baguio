json.array!(@challenge_partners) do |challenge_partner|
  json.extract! challenge_partner, :id, :name, :description, :website
  json.url challenge_partner_url(challenge_partner, format: :json)
end
