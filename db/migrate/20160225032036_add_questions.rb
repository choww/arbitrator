class AddQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user
      t.string :category
      t.string :content
      t.timestamps
      t.integer :time, default: 450
      t.boolean :resolved, default: false
      t.string :option_a
      t.string :option_b
    end
  end
end
