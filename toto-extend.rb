require 'coderay'
module Toto
	class Article
		def body
			markdown coderay(self[:body].sub(@config[:summary][:delim], '')) rescue markdown self[:body]
		end

		def summary length = nil
      config = @config[:summary]
      sum = if self[:body] =~ config[:delim]
        self[:body].split(config[:delim]).first
      else
        self[:body].match(/(.{1,#{length || config[:length] || config[:max]}}.*?)(\n|\Z)/m).to_s
      end
      markdown(coderay(sum.length == self[:body].length ? sum : sum.strip.sub(/\.\Z/, '&hellip;')))     
    end

		def coderay(text)
			text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      	CodeRay.scan($3, $2).div(:css => :class, :line_numbers => :table)
			end
		end
	end
end