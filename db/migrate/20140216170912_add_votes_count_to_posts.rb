class AddVotesCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :votes_count, :integer, :default =>0
    Post.reset_column_information
    Post.find_each do |p|
      p.update_attribute :votes_count, p.post_votes.length
      #Post.reset_counters p.id, :post_votes
    end
  end
end
