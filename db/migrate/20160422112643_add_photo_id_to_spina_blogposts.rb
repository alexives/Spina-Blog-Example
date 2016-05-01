class AddPhotoIdToSpinaBlogposts < ActiveRecord::Migration
  def change
    add_column :spina_blogposts, :photo_id, :integer
  end
end
