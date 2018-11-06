json.extract! survey, :id, :name, :user, :created_at, :updated_at
json.url survey_url(survey, format: :json)
