require "cloudphoto/aws/aws"

module Cloudphoto
  def list(album: nil)
    if album.nil?
      List.list_albums
    else
      List.list_photos(album)
    end
  end
  module_function :list

  module List
    def list_albums
      albums = Cloudphoto::Aws.list_objects.select do |path|
        /\A\.albums\/.+?\/\z/.match?(path)
      end
      albums.map! { |path| path.delete_prefix(".albums/").delete_suffix("/") }
      puts "Listing albums"
      puts "total #{albums.size}"
      puts albums
    end

    def list_photos(album)
      album_path = ".albums/#{album}/"
      photos = Cloudphoto::Aws.list_objects.select do |path|
        path.start_with?(album_path)
      end
      photos.reject! { |path| path == album_path }
      photos.map! { |path| path.delete_prefix(album_path) }

      puts "Listing #{album}:"
      puts "total #{photos.size}"
      puts photos
    end
    module_function :list_albums, :list_photos
  end
end
