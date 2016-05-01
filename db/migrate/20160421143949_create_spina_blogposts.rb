class CreateSpinaBlogposts < ActiveRecord::Migration
  def change
    create_table :spina_blogposts do |t|
      t.string :title
      t.text :description
      t.text :content

      t.timestamps null: false
    end
  end
end
