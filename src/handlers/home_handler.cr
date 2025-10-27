class HomeHandler < Marten::Handlers::RecordList
  
  model Article
  template_name "home.html"
  list_context_name "articles"

  before_render add_local_date_to_context

  private def add_local_date_to_context : Nil
    context[:datum] = I18n.localize(Time.local.date)
  end
  
end

