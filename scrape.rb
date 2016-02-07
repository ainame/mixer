require 'pry'
require 'mechanize'
require 'httparty'

agent = Mechanize.new
page = agent.get('http://soundeffect-lab.info/sound/anime/')
mp3_urls = page.links.select {|link| link.href =~ /download/ }.map{|l| File.join("http://soundeffect-lab.info/", l.href) }
mp3_urls.each do |url|
  filename = File.join("./mixer/SoundEffects/", url.split('/')[-1] + '.mp3')
  File.binwrite(filename, HTTParty.get(url, follow_redirects: true))
  puts filename
end
