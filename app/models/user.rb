class User < ActiveRecord::Base
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :first_name, :last_name, :birth_date, presence: true
    validates :password, presence:true, :length => { :minimum => 8, :maximum => 40 }, :confirmation =>true
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
    has_secure_password
    has_many :activities, foreign_key: "host_id"
    has_many :attendances, foreign_key: "attendee_id"
    has_many :attended_activities, through: :attendances
end
