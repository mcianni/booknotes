class AddScreenshotToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :screenshot, :string
  end
end
