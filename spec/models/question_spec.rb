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

  describe "validation" do

    let(:question) { Fabricate.build(:question)}

    it "title should add error when blank" do
      question.title = ""
      question.save
      question.errors.empty? should be false
    end

  end

end
