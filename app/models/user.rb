class User < ApplicationRecord
  has_many :services, :contracts
end
