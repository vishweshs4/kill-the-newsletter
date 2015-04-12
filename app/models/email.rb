class Email < ActiveRecord::Base
  belongs_to :feed, inverse_of: :emails, dependent: :destroy
end
