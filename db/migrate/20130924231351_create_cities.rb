class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|

      t.string :name
      t.string :abbrev

      t.timestamps
    end

    add_index :cities, :name, :unique => true
    add_index :cities, :abbrev, :unique => true
  end
end
