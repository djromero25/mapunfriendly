class Activity < ActiveRecord::Base
    belongs_to :host, class_name: "User", foreign_key: "host_id"
    has_many :attendees, through: :attended_activities
end
