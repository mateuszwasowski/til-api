class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :til_id
      t.integer :author_id

      t.timestamps
    end
  end
end
