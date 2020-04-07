json.extract! course, :id, :course_id, :describe, :created_at, :updated_at
json.url course_url(course, format: :json)
