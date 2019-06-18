class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :requests
end
