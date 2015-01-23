class AddPhotoUrlToEvents < ActiveRecord::Migration
  def change
    add_column :events, :photo_url, :string
  end
end
