class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :venu
      t.string :date
      t.integer :time
      t.text :description
      t.string :invitees
      t.string :status

      t.timestamps null: false
    end
  end
end
