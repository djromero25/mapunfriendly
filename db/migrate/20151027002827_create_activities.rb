class CreateActivities < ActiveRecord::Migration
    def change
        create_table :activities do |t|
            t.references :user, index: true
            t.string :name
            t.text :description
            t.string :type
            t.date :date_time
            t.integer :max_attendees
            t.decimal :cost
            t.decimal :latitude
            t.decimal :longitude

            t.timestamps
        end
    end
end
