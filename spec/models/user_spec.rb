require 'rails_helper'

RSpec.describe User do
  context "validations" do
    it { should have_many :authorizations }
    it { should validate_presence_of :email }
  end
end
