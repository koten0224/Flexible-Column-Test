class CreateAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :attributes do |t|
      t.references :object, polymorphic: true, null: false
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
