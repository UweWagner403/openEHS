# Generic handler for displaying details of an Article record.
# Inherits from Marten::Handlers::RecordDetail to leverage common functionality.

class ArticleDetailHandler < Marten::Handlers::RecordDetail
  model Article
  template_name "article_detail.html"
  record_context_name "article"  
end