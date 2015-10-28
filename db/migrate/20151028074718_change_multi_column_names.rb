class ChangeMultiColumnNames < ActiveRecord::Migration
    def change
        rename_column :activities, :user_id, :host_id
        rename_column :attended_activities, :user_id, :attendee_id
    end
end
