# - As a user,
# I want the ability to create a new account
# In order to play the game.
# Acceptance Criteria:
# Able to input email, and password.
# Validate that email and password are present.
# Password should be encrypted in Database.
# User account should be saved in Database

feature "Users signs up and signs in up normal with email address and password" do
  scenario "Happy Path, Sign Up and subsequent Sign In" do
    visit '/'
    click_link "sign up"
    fill_in "Email", with: "chad@example.com"
    fill_in "Password", with: "passwordA"
    fill_in "Password confirmation", with: "passwordA"
    click_button "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(current_path).to eq('/users/2')
    expect(page).not_to have_content "Sign Up"
    expect(page).not_to have_content "Sign In"

    click_link "sign out"
    current_path.should == root_path
    expect(page).to have_content "Signed out successfully."

    click_link "sign in"
    fill_in "Email", with: "chad@example.com"
    fill_in "Password", with: "passwordA"
    click_button "Sign in"
    expect(page).to have_content "Signed in successfully."
  end
end
