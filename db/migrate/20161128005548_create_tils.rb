class CreateTils < ActiveRecord::Migration[5.0]
  def change
    create_table :tils do |t|
      t.string :description
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
