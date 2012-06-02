require 'spec_helper'

describe Question do

  describe "by_user_id scope" do

    let(:user) { Fabricate(:user_with_three_questions) }

    it "user with questions should return expected questions" do
      questions = Question.by_user_id(user.id)
      questions.length.should eq 3
    end

    it "user without questions should return expected questions" do
      questions = Question.by_user_id(365)
      questions.length.should eq 0
    end

  end

  describe "validation specs" do

    let(:question) { Fabricate.build(:question)}

    it "empty title should be invalid" do
      question.title = ""
      question.should_not be_valid
      question.should have(1).errors_on(:title)
    end

    describe "question_type" do

      it "'text' is valid" do
        question.question_type = "text"
        question.should be_valid
      end

      it "'image' is valid" do
        question.question_type = "image"
        question.should be_valid
      end

      it "anything not 'image' or 'text' is invalid" do
        question.question_type = Forgery(:basic).text
        question.should_not be_valid
        question.should have(1).errors_on(:question_type)
      end

    end

    describe "user" do

      let(:user) { Fabricate(:user) }
      let(:question) { Fabricate(:question) }

      it "persisted user is valid" do
        question.user = user
        question.should be_valid
      end

      it "not persisted user is invalid" do
        question.user = User.new
        question.should_not be_valid
        question.should have(1).errors_on(:user)
      end

      it "null user should invalid" do
        question.user = nil
        question.should_not be_valid
        question.should have(1).errors_on(:user)
      end

    end

  end

end
