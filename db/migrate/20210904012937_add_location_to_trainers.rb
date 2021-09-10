class AddLocationToTrainers < ActiveRecord::Migration[6.0]
  def change
    add_column :trainers, :location, :string
  end
end
