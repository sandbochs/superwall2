helpers do
  def escape(text)
    Rack::Utils.escape_html(text)
  end
  def url_escape(text)
  	chunks = []
  	after = text
  	while after != "" do
  		before, match, after = after.partition(URI.regexp)
  		if before != ""
  			chunks.push(escape(before))
  		end
  		if match != ""
  			chunks.push("<a href=\"#{match}\">#{match}</a>")
  		end
  	end
  	chunks.join
  end
  alias_method :h, :escape
end