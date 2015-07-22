class CreateOppositions < ActiveRecord::Migration
  def change
    create_table :oppositions do |t|
      t.references :question, null: false
      t.references :user, null: false
      t.timestamps null: false
    end
  end
end
