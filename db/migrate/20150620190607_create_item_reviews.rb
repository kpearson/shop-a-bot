class CreateItemReviews < ActiveRecord::Migration
  def change
    create_table :item_reviews do |t|
      t.string :title
      t.text :body
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
