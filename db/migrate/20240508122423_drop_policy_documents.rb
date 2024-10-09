class DropPolicyDocuments < ActiveRecord::Migration[7.1]
  def change
    drop_table :policy_documents
  end
end
