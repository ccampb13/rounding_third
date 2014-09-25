require 'rails_helper'

RSpec.describe Trip, :type => :model do
  context "validations" do
    it { should validate_presence_of :start_date}
    it { should validate_presence_of :end_date}
    it { should validate_presence_of :city}
    it { should belong_to :user}
  end
end
