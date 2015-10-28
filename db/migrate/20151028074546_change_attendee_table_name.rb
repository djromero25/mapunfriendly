class ChangeAttendeeTableName < ActiveRecord::Migration
    def change
        rename_table :attendees, :attended_activities
    end
end
