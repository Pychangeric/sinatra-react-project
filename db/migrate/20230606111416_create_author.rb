class CreateAuthor < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.interger :contact
      t.string :email
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
