# frozen_string_literal: true

# Model for User
# A user is able to login and has roles
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
      principal_type: 'USER',
      principal_id: id,
      permissions: companies.map do |company|
        {
          company_id: company.id,
          operations: operations_by_company(company)
        }
      end
    }
  end

  private

  def operations_by_company(company)
    assignments.where(company: company).map(&:role).map(&:operations).flatten.map(&:key)
  end
end
