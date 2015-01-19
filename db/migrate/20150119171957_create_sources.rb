class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.string :link
      t.integer :content_id
      
      t.timestamps null: false
    end
  end
end
