require 'spec_helper'

describe Api::UsersController do

  describe "POST create" do

    let(:user) { Fabricate.build(:user) }

    before(:each) do
      request.env["HTTP_ACCEPT"] = "application/json"
    end

    describe "invalid JSON" do

      before(:each) do
        post :create, { user: { name: user.name, email: user.email, password: ""} }
      end

      it "should return 422 status" do
        response.status.should eq 422
      end

      it "json result should contain errors" do
        puts JSON.parse(response.body)["validation_errors"].should_not be_empty
      end

    end

    describe "valid JSON" do

      before(:each) do
        post :create, { user: { name: user.name, email: user.email, password: "Password"} }
      end

      it "should return 200 status" do
        response.status.should eq 200
      end

      it "should save user" do
        id = JSON.parse(response.body)["id"]
        persisted_user = User.find_by_id id
        persisted_user.name.should eq user.name
        persisted_user.email.should eq user.email
      end

    end

  end

end