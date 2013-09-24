class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :email
      t.integer :school_id
      t.integer :cohort_id

      t.timestamps
    end
  end
end
