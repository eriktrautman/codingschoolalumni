class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|

      t.datetime :start_date
      t.datetime :end_date
      t.integer :school_id
      t.integer :city_id

      t.timestamps
    end
    
    add_index :cohorts, :start_date
    add_index :cohorts, :end_date
    add_index :cohorts, [:start_date, :end_date], :unique => true
  end

end
