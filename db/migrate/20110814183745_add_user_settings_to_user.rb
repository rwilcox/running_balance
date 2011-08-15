class AddUserSettingsToUser < ActiveRecord::Migration
  def change
    add_column("users", "preference_attributes", :text)
  end
end
