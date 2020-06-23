class CreateJoinTableAuthorBook < ActiveRecord::Migration[5.2]
  def change
    create_join_table :authors, :books do |t|
      # t.index [:aouthor_id, :book_id]
      # t.index [:book_id, :aouthor_id]
    end
  end
end
