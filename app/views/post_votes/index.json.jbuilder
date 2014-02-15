json.array!(@post_votes) do |post_vote|
  json.extract! post_vote, :id, :voter_id, :quantity, :post_id, :user_id
  json.url post_vote_url(post_vote, format: :json)
end
