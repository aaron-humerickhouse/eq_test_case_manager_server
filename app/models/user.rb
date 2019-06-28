class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  has_many :assignments
  has_many :roles, through: :assignments
  has_many :companies, through: :assignments

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def jwt_payload
    { 
      target_type: 'USER',
      target_id: self.id,
      roles: self.roles.map(&:key),
      operations: self.roles.map(&:operations).flatten.map(&:key)
     }
  end   
end
