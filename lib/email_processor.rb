class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    token = @email.to.first.present? && @email.to.first.fetch(:token) { nil }
    if ! token.present?
      Rails.logger.info "E-mail discarded: Token not available."
      return
    end
    feed = Feed.find_by(token: token)
    if ! feed.present?
      Rails.logger.info "E-mail discarded: Token `#{ token }' not found."
      return
    end
    email = feed.emails.create!(
      subject: @email.subject,
      html: @email.raw_html,
      text: @email.raw_text
    )
    Rails.logger.info "E-mail recorded: Token `#{ token }', email `#{ email.id }'."
  end
end
