class AddFileContextToDocuments < ActiveRecord::Migration[7.1]
  def change
    add_column :documents, :file_context, :string
  end
end
