feature "Rounding Third Home Page" do
  scenario "is displayed when loading the site" do
    visit '/'
    expect(page).to have_content("Rounding Third")
  end
end
