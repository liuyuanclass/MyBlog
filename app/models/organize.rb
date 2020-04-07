class Organize < ApplicationRecord
  validates_uniqueness_of  :community_id,:scope=>:student_id
end
