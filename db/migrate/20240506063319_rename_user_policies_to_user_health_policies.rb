class RenameUserPoliciesToUserHealthPolicies < ActiveRecord::Migration[7.1]
  def change
    rename_table :user_policies, :user_health_policies
  end
end
