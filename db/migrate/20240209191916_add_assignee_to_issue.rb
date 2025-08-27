class AddAssigneeToIssue < ActiveRecord::Migration[7.1]
  def change
    add_reference :issues, :user, null: true, foreign_key: true
    rename_column :issues, :user_id, :assignee_id
  end
end
