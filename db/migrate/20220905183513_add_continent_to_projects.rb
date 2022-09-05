class AddContinentToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :continent, :string
  end
end
