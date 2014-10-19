class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :answer_type, null: false
      t.string :success_code, null: false
      t.text :description
      t.boolean :published, default: false, null: false
      t.references :quest, index: true, null: false
      t.timestamps
    end
  end
end
