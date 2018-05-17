class User < ApplicationRecord
  has_many :services
  has_many :contracts

  validates :username, uniqueness: true
end
