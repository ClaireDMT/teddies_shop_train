class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :item_1, foreign_key: { to_table: :teddies}
      t.references :item_2, foreign_key: { to_table: :teddies}
      t.string :match_date
      t.boolean :exchanged

      t.timestamps
    end
  end
end
