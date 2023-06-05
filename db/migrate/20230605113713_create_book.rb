class CreateBook < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :amount
      t.string :image_url
      t.string :description
      t.string :author
      t.string :format
      t.string :language
      t.string :genre
    end
  end
end