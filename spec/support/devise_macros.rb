module DeviseMacros
  def login_user
    user = create(:user)
    user.confirm!
    sign_in user
  end
end