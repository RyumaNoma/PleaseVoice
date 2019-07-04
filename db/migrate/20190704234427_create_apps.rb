class CreateApps < ActiveRecord::Migration[5.2]
  def change
    create_table :apps do |t|
      t.integer :user_id
      t.string :title
      t.string :url
      t.text :exp

      t.timestamps
    end
  end
end
