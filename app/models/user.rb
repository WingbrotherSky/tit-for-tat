class User < ApplicationRecord
  has_many :services
  has_many :contracts

  validates :username, uniqueness: true
  validates_length_of :services, maximum: 3
end
