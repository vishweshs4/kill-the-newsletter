class Feed < ActiveRecord::Base
  validates :token, uniqueness: true
end
