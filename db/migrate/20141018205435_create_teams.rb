class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :access_code, null: false
      t.boolean :is_admitted, default: false, null: false
      t.references :quest, index: true, null: false
      t.timestamps
    end
  end
end
