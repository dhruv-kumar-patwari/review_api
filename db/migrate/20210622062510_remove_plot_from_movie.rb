class RemovePlotFromMovie < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :plot, :string
  end
end
