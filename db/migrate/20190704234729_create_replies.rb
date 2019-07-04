class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.integer :app_id
      t.string :content
      t.string :text
      t.string :user_name

      t.timestamps
    end
  end
end
