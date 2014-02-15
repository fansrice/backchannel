json.array!(@comment_votes) do |comment_vote|
  json.extract! comment_vote, :id, :voter_id, :quantity, :post_comment_id, :user_id
  json.url comment_vote_url(comment_vote, format: :json)
end
