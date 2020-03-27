class Match < ApplicationRecord
  belongs_to :item_1_id, class_name: "Teddy"
  belongs_to :item_2_id, class_name: "Teddy"
end
