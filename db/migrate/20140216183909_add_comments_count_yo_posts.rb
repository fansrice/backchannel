class AddCommentsCountYoPosts < ActiveRecord::Migration
  def change
    add_column :posts, :comments_count, :integer, :default =>0
    Post.reset_column_information
    Post.find_each do |p|
      p.update_attribute :comments_count, p.post_comments.length
    end
  end
end
