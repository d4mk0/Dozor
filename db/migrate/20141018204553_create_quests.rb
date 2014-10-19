class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.string :name, null: false
      t.text :description
      t.boolean :published, default: false, null: false
      t.timestamps
    end
  end
end
