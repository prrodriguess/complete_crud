class CreateBooks < ActiveRecord::Migration[7.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :string
      t.string :author
      t.string :publication_year
      t.string :integer
      t.string :genre

      t.timestamps
    end
  end
end
