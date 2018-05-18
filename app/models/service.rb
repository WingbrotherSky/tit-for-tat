class Service < ApplicationRecord
  belongs_to :user
  has_many :contracts
  validates_length_of :services, maximum: 3
  include PgSearch

  pg_search_scope :search_by_keyword, against: [:name, :description], associated_against: {
    user: :username
  }, :using => {
                    :tsearch => {:prefix => true,
                                  dictionary: "simple"}
                  }
end
