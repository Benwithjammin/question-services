require 'spec_helper'

describe Question do

  context "all_by_user_id scope should return expected question" do
    let(:question) { Fabricate(:question) }
    it { puts question.all_by_user_id }
  end

end
