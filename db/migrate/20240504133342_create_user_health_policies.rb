class CreateUserHealthPolicies < ActiveRecord::Migration[7.1]
  def change
    create_table :user_health_policies do |t|

      t.references :user, null: false, foreign_key: true
      t.references :health_policy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
