class AddSlugToSpinaBlogposts < ActiveRecord::Migration
  def change
    add_column :spina_blogposts, :slug, :string
  end
end
