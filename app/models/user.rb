class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  def jwt_payload
    { 
      email: self.email,
      role: ['role1', 'role2'],
      permissions: [
        'role1_permission1',
        'role1_permission2',
        'role1_permission3',
        'role1_permission4',
        'role2_permission1',
        'role2_permission2',
        'role2_permission3',
        'role2_permission4'
      ]
     }
  end
        
end
