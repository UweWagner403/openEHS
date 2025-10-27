class UserProfileHandler < Marten::Handler
  #include Auth::RequireSignedInUser

  def get
    render "auth/profile.html" 
  end
end