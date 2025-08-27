json.extract! issue, :id, :title, :status, :priority, :body, :created_at, :updated_at
json.url issue_url(issue, format: :json)
