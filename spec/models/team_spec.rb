require 'rails_helper'

RSpec.describe Team, :type => :model do
  context 'validations' do
    it { should have_many :away_games}
    it { should have_many :home_games}
  end
end
