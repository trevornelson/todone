class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :user, index: true
      t.string :title, :null => false, :default => ''
      t.boolean :completed, :default => false
      t.boolean :archived, :default => false
      t.integer :order

      t.timestamps
    end
  end
end
