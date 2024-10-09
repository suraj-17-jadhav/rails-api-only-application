class CreateUserPolicies < ActiveRecord::Migration[7.1]
  def change
    create_table :user_policies do |t|
      t.references :user, foreign_key: true
      t.string :policy_name
      t.date :expiry_date
      
      t.timestamps
    end
  end
end
