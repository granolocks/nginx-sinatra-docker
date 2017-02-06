require "rubygems"
require "sinatra"

class BasicServer < Sinatra::Base
  get "/" do
    o = []
    o << "<div><ul>"
    Dir.entries("/app/public/").reject{|x| x == "." || x== ".." }.each do |f|
      o << "<li><a href='/#{f}'>#{f}</a></li>"
    end
    o << "</ul></div>"
    o.join
  end
end
