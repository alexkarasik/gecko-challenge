class AddColumnTimestampToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :object_timestamp, :integer
  end
end
