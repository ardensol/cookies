class Addbooleanstoappointments < ActiveRecord::Migration
  def change
  	add_column :appointments, :deep_clean, :boolean
  	add_column :appointments, :inside_fridge, :boolean
  	add_column :appointments, :inside_oven, :boolean
  	add_column :appointments, :inside_windows, :boolean
  	add_column :appointments, :inside_cabinets, :boolean
  	add_column :appointments, :walls, :boolean
  	add_column :appointments, :move_inout, :boolean
  end
end
