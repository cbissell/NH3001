# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  email          :string(255)
#  StartDate      :string(255)
#  OfficeLocation :string(255)
#  ComputerType   :string(255)
#  department     :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :computerType, :officeLocation, :startDate, :department, :email, :name

  before_save { |user| user.email = email.downcase }
  validates :name, presence: true,  length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
