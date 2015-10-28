class Attendance < ActiveRecord::Base
    belongs_to :attendee, class_name: "User"
    belongs_to :attended_activity, class_name: "Activity"
end
