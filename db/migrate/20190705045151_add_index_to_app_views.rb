class AddIndexToAppViews < ActiveRecord::Migration[5.2]
  def change
    add_column :apps, :views, :integer, default: 0
  end
end
