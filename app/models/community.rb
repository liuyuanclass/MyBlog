class Community < ApplicationRecord
  validates_uniqueness_of  :community_id
end
