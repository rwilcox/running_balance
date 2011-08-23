class AddActiveAtDateToTransaction < ActiveRecord::Migration
  def change
    add_column("transactions", "active_on", :date)
  end
end
