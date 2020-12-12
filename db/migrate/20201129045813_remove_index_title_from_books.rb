class RemoveIndexTitleFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_index :books, column: [:publish, :title]
  end
end
