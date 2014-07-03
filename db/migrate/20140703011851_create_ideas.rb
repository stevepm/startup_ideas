class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.string :user
    end
    add_index :ideas, :user
  end
end
