class Ride < ApplicationRecord
  belongs_to :user
  has_many :requests
  belongs_to :driver, :class_name => "User", optional: true
end
