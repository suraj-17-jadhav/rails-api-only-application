class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :file_name 
      t.string :file_type
      t.text :file_location
      t.timestamps
    end
  end
end
