class Business < ApplicationRecord
   validates_uniqueness_of  :business_id,:scope=>:leader_id
end
