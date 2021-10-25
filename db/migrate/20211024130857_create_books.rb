class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.date :creation_date
      t.string :content
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
