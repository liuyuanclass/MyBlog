class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_format_of :user_id, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  devise :database_authenticatable, :authentication_keys => [:user_id]

  #has_one :student

  def admin?
    self.role == "admin"
  end

  def student?
    self.role == "student"
  end
  def teacher?
    self.role == "teacher"
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.user_id || self.email
  end

  def self.find_for_database_authentication(warden_conditions)

    conditions = warden_conditions.dup

    if login = conditions.delete(:login)

      where(conditions.to_h).where(["lower(user_id) = :value OR lower(email) = :value", { :value => login.downcase }]).first

    elsif conditions.has_key?(:user_id) || conditions.has_key?(:email)

      where(conditions.to_h).first

    end

  end



end


