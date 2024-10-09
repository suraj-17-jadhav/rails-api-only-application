class Drop < ActiveRecord::Migration[7.1]
  def change
    drop_table :user_health_policies
  end
end
