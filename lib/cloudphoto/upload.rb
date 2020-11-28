require "cloudphoto/aws/aws"

module Cloudphoto
  def upload(path:, album:)
    photos = Dir["#{path}/*.jpeg"] + Dir["#{path}/*.jpg"]
    result = photos.map do |photo|
      uploaded = Cloudphoto::Aws.upload_object(
        photo,
        to: "#{ALBUMS_PREFIX}/#{album}/#{File.basename(photo)}"
      )
      [photo, uploaded]
    end

    result.each do |path, success|
      puts "Upload #{path} #{success ? 'done' : 'fail'}"
    end
  end
  module_function :upload
end
