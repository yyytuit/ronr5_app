class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :book, foreign_key: {on_delete: :cascade}
      t.references :user, foreign_key: true
      t.integer :status, default: 0, null: false
      t.text :body

      t.timestamps
    end
  end
end
