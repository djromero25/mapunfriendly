class User < ActiveRecord::Base
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :full_name, :last_name, :birth_date, presence: true
    validates :password, presence:true, :length => { :minimum => 8, :maximum => 40 }, :confirmation =>true
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
    has_secure_password
    has_many :events
    has_many :connected_users, through: :connections
end
