require "cloudphoto/aws/aws"

module Cloudphoto
  def list(album: nil)
    list = if album.nil?
      List.list_albums
    else
      List.list_photos(album)
    end

    puts "total #{list.size}"
    puts list
  end
  module_function :list

  module List
    def list_albums
      albums = Cloudphoto::Aws.list_objects.select do |path|
        /\A\.albums\/.+?\/\z/.match?(path)
      end
      albums.map! { |path| path.delete_prefix("#{ALBUMS_PREFIX}/").delete_suffix("/") }
    end

    def list_photos(album)
      album_path = "#{ALBUMS_PREFIX}/#{album}/"
      photos = list_keys(album_path)
      photos.map! { |path| path.delete_prefix(album_path) }
    end

    def list_keys(prefix)
      Cloudphoto::Aws.list_objects.select do |path|
        path.start_with?(prefix)
      end.reject { |path| path == prefix }
    end

    module_function :list_albums, :list_photos, :list_keys
  end
end
