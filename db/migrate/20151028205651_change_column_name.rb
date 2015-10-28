class ChangeColumnName < ActiveRecord::Migration
    def change
        rename_column :attendances, :activity_id, :attended_activity_id
    end
end
