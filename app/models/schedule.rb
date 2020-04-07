class Schedule < ApplicationRecord

  validates_uniqueness_of  :teachclass_id,:scope=>:student_id
end
