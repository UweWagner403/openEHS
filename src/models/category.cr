class Category < Marten::Model
  with_timestamp_fields
  field :id, :big_int, primary_key: true, auto: true
  field :name, :string, max_size: 100
  field :description, :text, null: true, default: nil
  field :article, :many_to_one, to: Article
  field :created_at, :date_time, auto_now_add: true, blank: true
  field :updated_at, :date_time, auto_now: true, blank: true  
end
