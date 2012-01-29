class AddProcessedToHaves < ActiveRecord::Migration
  def change
    add_column :haves, :processed, :boolean
  end
end
