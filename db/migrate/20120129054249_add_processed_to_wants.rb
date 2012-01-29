class AddProcessedToWants < ActiveRecord::Migration
  def change
    add_column :wants, :processed, :boolean
  end
end
