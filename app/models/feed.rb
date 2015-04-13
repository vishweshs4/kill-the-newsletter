class Feed < ActiveRecord::Base
  has_many :emails, inverse_of: :feed
  validates :token, uniqueness: true

  def entries
    emails.map { |email| Entry.from_email email }
  end
end
