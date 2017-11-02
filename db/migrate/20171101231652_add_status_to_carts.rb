class AddStatusToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :status, :string, default: "in progress"
  end
end
