class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :title
      t.string :start
      t.string :end

      t.timestamps null: false
    end
  end
end
