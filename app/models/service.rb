class Service < ApplicationRecord
  belongs_to :user
  has_many :contracts

  include PgSearch

  pg_search_scope :search_by_keyword, against: [:name, :description], associated_against: {
    user: :username
  }
end
