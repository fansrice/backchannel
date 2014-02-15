class CreatePostComments < ActiveRecord::Migration
  def change
    create_table :post_comments do |t|
      t.integer :commentor_id
      t.text :body
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps
    end
  end
end
