class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.integer :rate
      t.integer :lock_version, default: 0

      t.timestamps
    end
  end
end
