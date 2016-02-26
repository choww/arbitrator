class AddTaggedUserToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :tagged_user, :string
  end
end
