class CreateSnowresorts < ActiveRecord::Migration[6.0]
  def change
    create_table :snowresorts do |t|
      t.string :resort_name,   null: false
      t.text :introduction,    null: false
      t.text :details,         null: false
      t.references :user,      null: false, foreign_key:true

      t.timestamps
    end
  end
end
