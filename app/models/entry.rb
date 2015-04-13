class Entry
  include ActiveModel::Model
  attr_accessor :id, :created_at, :title, :body, :author

  def self.from_email email
    new(
      id: email.id,
      created_at: email.created_at,
      title: email.subject,
      body: if email.html.present? then email.html else email.text end,
      author: email.from,
    )
  end
end
