require 'spec_helper'

describe Question do

  describe "by_user_id scope" do

    context "user with questions" do

      subject { Fabricate(:user_with_three_questions) }

      it "should return expected questions" do
        Question.by_user_id(subject.id).length.should == 3

      end
    end

  end

end
