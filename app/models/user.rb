class User < ApplicationRecord
    has_many :articles
    before_save {self.email= email.downcase}
    validates :username, presence: true,
    uniqueness: {case_sensitive:false}, 
    length:{minimum:3, maximum:15}

    VALID_EMAIL_REGEX = /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
    uniqueness: {case_sensitive:false},
    length:{minimum:3, maximum:50},
    format: {with: VALID_EMAIL_REGEX}

    has_secure_password
    
end