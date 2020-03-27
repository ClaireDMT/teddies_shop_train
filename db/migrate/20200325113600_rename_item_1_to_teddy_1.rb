class RenameItem1ToTeddy1 < ActiveRecord::Migration[5.2]
  def change
    rename_column :matches, :item_1_id, :teddy_1
    rename_column :matches, :item_2_id, :teddy_2
  end
end
