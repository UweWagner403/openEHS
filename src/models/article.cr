class Article < Marten::Model
  with_timestamp_fields
  field :id, :big_int, primary_key: true, auto: true
  field :title, :string, max_size: 255
  field :content, :text
  field :quelle, :string, max_size: 255,  null: true, default: nil
  field :created_at, :date_time, auto_now_add: true, blank: true
  field :updated_at, :date_time, auto_now: true, blank: true  
end

