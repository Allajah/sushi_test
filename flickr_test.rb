require 'flickraw'
require 'yaml'
settings=YAML.load(File.open('./settings.yml'))
FlickRaw.api_key=settings["flickr_api_key"]
FlickRaw.shared_secret=settings["flickr_shared_secret"]
flickr.access_token=settings["flickr_access_token"]
flickr.access_secret=settings["flickr_access_secret"]
flickr.test.login
@photos=flickr.photos.search(text: '寿司', license:"1,2,3,4,5,6")
@photos.each do |photo|
  url = "http://farm#{photo.farm}.static.flickr.com/#{photo.server}/#{photo.id}_#{photo.secret}_n.jpg"
  puts url
end

