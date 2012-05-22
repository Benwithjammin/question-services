require 'spec_helper'

describe Api::UsersController do

  describe "POST create" do

    let(:user) { Fabricate.build(:user) }

    before(:each) do
      #request.env['content-type'] = 'application/json'
      #post :create, {  format: :json, name: user.name, email: user.email, password: "Four" }, content_type: 'application/json'
      #post :create, user: {  name: user.name, email: user.email, password: "Four" }, content_type: 'application/json'
      #post :create, format: :json, user: {  name: user.name, email: user.email, password: "Four" }, content_type: 'application/json'
    end

    it "invalid json returns 422" do
      request.env["HTTP_ACCEPT"] = "application/json"

      post :create, body: { user: user }, content_type: 'application/json'
      puts response.body
    end

    it "valid user saves model" do

    end

  end

end