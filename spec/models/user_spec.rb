require 'rails_helper'

describe User do
  describe "validations" do
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of :email}
    it {should validate_presence_of :password_digest}
  end

  describe "class methods" do
    it "#create_api_key" do
      user = User.create!(email: 'email@gamil.com', password: '1234', password_confirmation: '1234')

      user.save

      recent_user = User.last
      expect(recent_user.api_key).to_not be_nil
    end
  end
end