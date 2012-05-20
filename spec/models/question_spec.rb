require 'spec_helper'

describe Question do

  context "all_by_user_id scope should return expected question" do
    let(:user) { Fabricate(:user_with_three_questions) }
    it { puts user}
  end

end
