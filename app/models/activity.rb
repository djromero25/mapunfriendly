class Activity < ActiveRecord::Base
    belongs_to :host, class_name: "User"
    has_many :attendances, foreign_key: "attended_activities_id"
    has_many :attendees, through: :attendances
end
