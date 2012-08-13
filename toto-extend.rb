require 'coderay'
module Toto
	class Article
		def body
			markdown coderay(self[:body].sub(@config[:summary][:delim], '')) rescue markdown self[:body]
		end
		def coderay(text)
			text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      	CodeRay.scan($3, $2).div(:css => :class)
			end
		end
	end
end