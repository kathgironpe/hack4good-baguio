json.array!(@challenges) do |challenge|
  json.extract! challenge, :id, :user_id, :challenge_partner_id, :title, :description
  json.url challenge_url(challenge, format: :json)
end
