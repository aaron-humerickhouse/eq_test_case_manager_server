# frozen_string_literal: true

# Model for JwtBlacklist
class JwtBlacklist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Blacklist
  self.table_name = 'jwt_blacklist'
end
