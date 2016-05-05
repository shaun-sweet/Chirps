class CreateChirps < ActiveRecord::Migration
  def change
    create_table :chirps do |t|
      t.integer :user_id
      t.string :body

      t.timestamps null: false
    end
  end
end
