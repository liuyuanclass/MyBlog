  class Account < ActiveRecord::Base
    has_secure_password
    validates :account_id  ,uniqueness: true

    end


