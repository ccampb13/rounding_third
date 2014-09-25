require 'rails_helper'

RSpec.describe Game, :type => :model do
  context "validations" do
    it { should belong_to :venue }
    it { should belong_to :home_team}
    it { should belong_to :away_team}
  end
end
