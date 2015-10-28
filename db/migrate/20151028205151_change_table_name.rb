class ChangeTableName < ActiveRecord::Migration
    def change
        rename_table :attended_activities, :attendances
    end
end
