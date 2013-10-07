class AddTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :linkedin_token, :string
  end
end
