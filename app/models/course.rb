class Course < ApplicationRecord
  validates :course_id  ,uniqueness: true
end
