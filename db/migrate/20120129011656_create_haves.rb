class CreateHaves < ActiveRecord::Migration
  def change
    create_table :haves do |t|
      t.string :name
      t.string :isbn
      t.string :author
      t.integer :user_id

      t.timestamps
    end
  end
end
