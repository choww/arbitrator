class AddVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :question
      t.references :user
      t.integer :value
      t.timestamps
    end
  end
end
