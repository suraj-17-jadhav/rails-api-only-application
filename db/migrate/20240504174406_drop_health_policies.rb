class DropHealthPolicies < ActiveRecord::Migration[7.1]
  def change
    drop_table :health_policies
  end
end
