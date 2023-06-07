class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :username
      t.string :description
      t.string :title
      t.integer :user_id
    end
  end
end
