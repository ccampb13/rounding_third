Fabricator(:user) do
  uid { sequence(:uid, 12345).to_s }
  # facebook_username { sequence(:username){ |i| "bob#{i}" } }
  # facebook_access_token{ ENV["FACEBOOK_ACCESS_TOKEN"] }
  name { "Bob Davies" }
  email{ "bob@aol.com" }
  password{ "password1" }

end
