class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :email, :unique => true
    add_index :users, :school_id
    add_index :users, :cohort_id
  end
end
