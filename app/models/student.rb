class Student < ApplicationRecord
  belongs_to :class1, optional: true
  validates :student_id ,presence:true ,uniqueness: true
  validates :name ,presence: true
  validates :class_id,presence: true
  validates :dormitory ,presence: true

  validates :phone , presence: true ,length: {is: 11}
end
