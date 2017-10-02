class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.integer :object_id
      t.string :object_type
      t.string :object_changes

      t.timestamps
    end
  end
end
