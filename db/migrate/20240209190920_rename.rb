class Rename < ActiveRecord::Migration[7.1]
  def change
    rename_column :issues, :user_id, :author_id
  end
end
