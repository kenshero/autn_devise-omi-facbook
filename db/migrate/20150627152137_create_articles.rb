class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.text :detail
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
