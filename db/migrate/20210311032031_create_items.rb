class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :name
      t.text :text
      t.integer :category_id 
      t.integer :status_id 
      t.integer :fee_id   
      t.integer :prefecture_id 
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

