class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  has_many :companies
  # before_create :set_user_role

  attribute :role, :string, default: "admin"
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :database_authenticatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
         
  def jwt_payload
    super
  end

  ROLES = %w{super_admin admin user editor collobrator}

  ROLES.each do |role_name|
    define_method "#{role_name}?" do
       role == role_name      
    end
  end

  def set_user_role
    self.role = "admin"
  end
end
