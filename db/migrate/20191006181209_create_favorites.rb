class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.boolean :like, default: false
      t.text :review
      t.integer :user_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
