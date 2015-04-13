atom_feed do |feed|
  feed.title @feed.title
  feed.updated(@feed.entries.first.created_at) if @feed.entries.length > 0

  @feed.entries.each do |entry|
    feed.entry(entry, url: '') do |entry_builder|
      entry_builder.title(entry.title)
      entry_builder.content(entry.body, type: 'html')

      entry_builder.author do |author|
        author.name entry.author
      end
    end
  end
end
