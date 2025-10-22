class ArticleSchema < Marten::Schema
  field :title, :string, max_size: 255
  field :content, :string
  field :quelle, :string, max_size: 255
end