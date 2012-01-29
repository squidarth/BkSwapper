class CreateWants < ActiveRecord::Migration
  def change
    create_table :wants do |t|
      t.string :name
      t.string :isbn
      t.string :author
      t.integer :user_id

      t.timestamps
    end
  end
end
