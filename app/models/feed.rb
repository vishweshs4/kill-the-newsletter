class Feed < ActiveRecord::Base
  has_many :emails, inverse_of: :feed

  validates :title, presence: true
  validates :token, presence: true

  validates :token, uniqueness: true

  def initialize(*)
    super
    self.token ||= SecureRandom.hex 25
  end

  def to_param
    token
  end

  def entries
    emails.order(created_at: :desc).map { |email| Entry.from_email email }
  end
end
