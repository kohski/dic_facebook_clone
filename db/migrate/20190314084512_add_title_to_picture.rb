class AddTitleToPicture < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :title, :string
  end
end
