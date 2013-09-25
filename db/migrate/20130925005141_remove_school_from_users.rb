class RemoveSchoolFromUsers < ActiveRecord::Migration
  def change

    remove_index :users, :column => :school_id
    remove_column :users, :school_id
  end
end
