class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.references :list
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
