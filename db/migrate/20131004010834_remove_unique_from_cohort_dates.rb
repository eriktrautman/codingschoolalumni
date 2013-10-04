class RemoveUniqueFromCohortDates < ActiveRecord::Migration
  def change
    remove_index :cohorts, :column => [:start_date, :end_date]
    add_index :cohorts, [:start_date, :end_date]  
  end
end
