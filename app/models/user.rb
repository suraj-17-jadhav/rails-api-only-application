# frozen_string_literal: true

class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  encrypts :name
  encrypts :email
  encrypts :dob
  encrypts :mobile_number
  encrypts :role

  has_many :user_health_policies
  has_many :health_policies, through: :user_health_policies
  has_many :documents
  has_many :policy_documents

  def admin?
    role == 'admin'
  end

  def user?
    role == 'user'
  end


  def authenticate(email, password)
    user = find_by(email: email)
    user if user&.authenticate(password)
  end

end
