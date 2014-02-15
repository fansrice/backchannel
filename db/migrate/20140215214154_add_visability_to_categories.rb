class AddVisabilityToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :visability, :string
  end
end
