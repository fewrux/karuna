class AddAboutToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :about, :text
  end
end
