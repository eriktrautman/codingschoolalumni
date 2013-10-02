class ChangeUsersEmailsToNotNull < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, :null => false
    change_column :users, :cohort_id, :integer, :null => false
  end
end
