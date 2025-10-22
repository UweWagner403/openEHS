
class ArticleCreateHandler < Marten::Handlers::RecordCreate
  #include Auth::RequireSignedInUser
  
  model Article
  schema ArticleSchema
  template_name "article_create.html"
  success_route_name "home"

  before_dispatch :require_signed_in_user

  private def require_signed_in_user
    unless request.user
      redirect("/auth/signin")
    end
  end
end
