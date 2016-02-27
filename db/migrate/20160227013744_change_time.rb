class ChangeTime < ActiveRecord::Migration
  def change
    change_column :questions, :time, :integer, default: 5
  end
end
