# frozen_string_literal: true

class User < ApplicationRecord
  extend FormBase
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_profile

  rails_admin do

    User.refresh_methods.each do |question|
      field question[:name].to_sym, question[:type].to_sym do
        formatted_value { bindings[:object].send(question[:name]) }
      end
    end


  end

  def admin?
    admin == true
  end

  after_create do
    # UserProfile.create(user: self)
  end
end
