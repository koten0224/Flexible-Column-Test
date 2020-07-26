class Tutorial < ApplicationRecord
  flexible_column :title, :desc, default: "lalala", type: :string
  flexible_column :price, default: 0, type: :integer
end
