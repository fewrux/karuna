class ChangeUserIdAndOrganizationIdNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:messages, :user_id, true)
    change_column_null(:messages, :organization_id, true)
  end
end
