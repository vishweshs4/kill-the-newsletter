class Feed < ActiveRecord::Base
  has_many :emails, inverse_of: :feed
  validates :token, uniqueness: true
end
