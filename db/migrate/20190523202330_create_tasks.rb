class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.date :due
      t.string :tags
      t.belongs_to :list, foreign_key: true

      t.timestamps
    end
  end
end
