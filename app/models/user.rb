# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_profile

  rails_admin do
  end

  def admin?
    admin == true
  end

  after_create do
    # UserProfile.create(user: self)
  end
end
