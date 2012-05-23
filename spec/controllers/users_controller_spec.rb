require 'spec_helper'

describe Api::UsersController do

  describe "POST create" do

    let(:user) { Fabricate.build(:user) }

    before(:each) do
      request.env["HTTP_ACCEPT"] = "application/json"
    end

    it "invalid json returns 422" do
      post :create, { user: { name: user.name, email: user.email, password: "Pa55word"} }
      puts response.body
    end

    it "valid user saves model" do

    end

  end

end