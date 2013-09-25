class CreateCampuses < ActiveRecord::Migration
  def change
    create_table :campuses do |t|

      t.integer :school_id
      t.integer :city_id

      t.timestamps
    end

    add_index :campuses, [:school_id, :city_id], :unique => true
  end
end
