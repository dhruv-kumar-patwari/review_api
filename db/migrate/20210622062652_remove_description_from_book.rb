class RemoveDescriptionFromBook < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :description, :string
  end
end
