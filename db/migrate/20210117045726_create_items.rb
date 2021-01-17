class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :photo
      t.float :unit_price
      t.references :merchant, null: false, foreign_key: true
      t.timestamps
    end
  end
end
