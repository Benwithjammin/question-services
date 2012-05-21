require 'spec_helper'

describe Api::UsersController do

  context "POST create" do

    let(:user) { Fabricate.build(:user) }

    it "valid user saves model" do
      puts user.as_json(only: [:name, :email, :password])
    end

  end

end