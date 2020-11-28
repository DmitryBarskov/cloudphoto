require "cloudphoto/aws/aws"

module Cloudphoto
  def download(album:, path:)
    photo_keys = Cloudphoto::List.list_keys("#{ALBUMS_PREFIX}/#{album}/")

    photos = photo_keys.map do |key|
      Cloudphoto::Aws.download_object(key: key, to: "#{path}/#{File.basename(key)}")
    end

  end
  module_function :download
end
