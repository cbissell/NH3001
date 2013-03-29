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

require 'spec_helper'

describe User do

  before { @user = User.new(name: "Example User", email: "user@example.com", startDate: "01/12/2013", 
  							officeLocation: "101 Marietta St. Atlanta, GA", computerType: "Retina", 
  							department: "Engineering" ) }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:startDate) }
  it { should respond_to(:officeLocation) }
  it { should respond_to(:computerType) }
  it { should respond_to(:department) }
it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
end