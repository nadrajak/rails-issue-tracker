class CreateIssues < ActiveRecord::Migration[7.1]
  def change
    create_table :issues do |t|
      t.string :title
      t.string :status
      t.string :priority
      t.text :body

      t.timestamps
    end
  end
end
