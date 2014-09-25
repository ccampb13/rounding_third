# ## User creates a new trip

# As a user
# I want to create a new trip

# Acceptance Criteria:
# * User must be logged in

# Usage:
# * User clicks "Add Another Garden" (if they already have a garden) or "Setup your First Garden" (if this is their first garden)
# * The garden is created with an auto-generated name and default dimensions
# * The user is taken to the edit garden screen for that garden

feature "User creates a new trip" do
  background do
    @user = Fabricate(:user)
    visit new_trip_path
  end

  scenario "when the user doesn't have any trips" do
    click_button "Search"
  end
end
