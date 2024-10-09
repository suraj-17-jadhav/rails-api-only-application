class UserHealthPolicy < ApplicationRecord
    belongs_to :user
    
    validates :policy_name, presence: true
    validates :expiry_date, presence: true
end