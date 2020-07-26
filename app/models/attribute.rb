class Attribute < ApplicationRecord
  belongs_to :object, polymorphic: true
end
