require 'spec_helper'

describe Api::QuestionsController do

  password = "Pa55word"
  let(:user) { Fabricate(:user, password: password) }

  before(:each) do
    request.env["HTTP_ACCEPT"] = "application/json"
    request.env["HTTP_ACCEPT"] = "application/json"
    request.env["x-username"] = user.email
    request.env["x-password"] = password
  end

  describe "index GET" do

    before(:each) do
      3.times { Fabricate(:question) }
      get :index
    end

    it "should return 200 status" do
      response.status.should eq 200
    end

    it "should return expected questions" do
      JSON.parse(response.body).length.should eq 3
    end

  end

  describe "show GET" do

    before(:each) do
      @question = Fabricate(:question)
      get :show, id: @question.id
    end

    it "should return 200 status" do
      response.status.should eq 200
    end

    it "should return expected question" do
      JSON.parse(response.body)["id"].should eq @question.id
    end

  end

  describe "by_user GET" do

    before(:each) do
      @user = Fabricate(:user_with_three_questions)
      get :by_user, id: @user.id
    end

    it "should return 200 status" do
      response.status.should eq 200
    end

    it "should return expected question" do
      JSON.parse(response.body).length.should eq 3
    end

  end

  describe "Invalid http header credentials supplied" do

    before(:each) do
      request.env["HTTP_ACCEPT"] = "application/json"
      request.env["x-username"] = user.email
      request.env["x-password"] = "THE WRONG PASSWORD"
    end

    it "should return 401 status for index GET" do
      get :index
      response.status.should eq 401
    end

    it "should return 401 status for show GET" do
      get :show, id: 1
      response.status.should eq 401
    end

    it "should return 401 status for by_user GET" do
      get :by_user, id: 1
      response.status.should eq 401
    end

    it "should return 401 status for create POST" do
      post :create, { question: { title: "Foo", question_type: "text"} }
      response.status.should eq 401
    end

  end

end

