require 'rails_helper'

RSpec.describe Authorization do
  context "validations" do
    it { should belong_to :user }
  end
end
