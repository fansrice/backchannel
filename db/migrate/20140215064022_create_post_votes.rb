class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.integer :voter_id
      t.integer :quantity
      t.references :post, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
