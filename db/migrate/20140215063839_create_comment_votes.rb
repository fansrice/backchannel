class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.integer :voter_id
      t.integer :quantity
      t.references :post_comment, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
