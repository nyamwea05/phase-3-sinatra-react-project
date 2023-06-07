class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :text
      t.string :title
      t.string :category
      t.date :due_date
      t.time :start_time
      t.time :end_time
      t.integer :priority
      t.text :description
      t.boolean :is_complete, default: false

      t.timestamps
    end
  end
end
