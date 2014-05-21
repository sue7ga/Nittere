# -*- coding: utf-8 -*-
require 'rexml/document'
require 'open-uri'
require 'nkf'

class Nittere

  @@baseurl = 'http://appli.ntv.co.jp/ntv_WebAPI/program/'

  def initialize(apikey = "zbm57ygyvg78mxbkSEEOJpRkLNQvBhadRmeuuw3KFv5vTAmWXujaQS4ktbtu")
    @@apikey = apikey
  end
  
  def show
   url = @@baseurl + "?key=" +  @@apikey + "&title=NEWS"
   escape_url = URI.escape(url)
   parse_url = URI.parse(escape_url)
   result = open(parse_url)
   doc = REXML::Document.new(result)
   return doc
  end

end

nittere = Nittere.new()

doc = nittere.show

title = []
url = []
airtime = []
castlist = []

doc.elements['programs'].each{
 |element|
 title << element.to_s.scan(/<title>(.+)<\/title>/)
 url << element.to_s.scan(/<url>(.+)<\/url>/)
 airtime << element.to_s.scan(/<airtime>(.+)<\/airtime>/) 
 castlist << element.to_s.scan(/<castlist>(.+)<\/castlist>/)
 
}

p castlist




