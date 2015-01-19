class ChangeContentTableContentColumnName < ActiveRecord::Migration
  def change
    change_table :contents do |t|
      t.rename :content, :resource
    end
  end
end
