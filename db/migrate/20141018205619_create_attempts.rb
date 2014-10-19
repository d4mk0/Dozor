class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.string :result, null: false
      t.string :code
      t.attachment :photo
      t.references :task, index: true, null: false
      t.references :team, index: true, null: false
      t.timestamps
    end
  end
end
