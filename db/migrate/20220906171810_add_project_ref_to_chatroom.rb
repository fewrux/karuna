class AddProjectRefToChatroom < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :project, index: true
  end
end
