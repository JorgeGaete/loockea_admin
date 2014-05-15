def sign_in(admin, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = Admin.new_remember_token
    cookies[:remember_token] = remember_token
    admin.update_attribute(:remember_token, Admin.digest(remember_token))
  else
    visit signin_path
    fill_in "Email",    with: admin.email
    fill_in "Password", with: admin.password
    click_button "Sign in"
  end
end