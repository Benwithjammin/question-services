require 'spec_helper'
include Sorcery::TestHelpers::Rails

describe User do

  describe "validation specs" do

    let(:user) { Fabricate.build(:user) }

    describe "email" do

      it "model should be valid if present" do
        user.should be_valid
      end

      it "model should be invalid if blank" do
        user.email = ""
        user.should_not be_valid
        user.should have(1).errors_on(:email)
      end

      it "model should be invalid if duplicate" do
        user.save
        dupe = Fabricate.build(:user)
        dupe.email = user.email
        dupe.should_not be_valid
        dupe.should have(1).errors_on(:email)
      end

    end

    describe "password" do

      it "model should be valid if present and 5 or more characters long" do
        user.password = "Pa55word"
        user.should be_valid
      end

      it "model should be invalid if present but less than 5 characters long" do
        user.password = "four"
        user.should_not be_valid
        user.should have(1).errors_on(:password)
      end

      it "model should be invalid if blank" do
        user.password = ""
        user.should_not be_valid
        user.should have(2).errors_on(:password)
      end

    end

  end

end