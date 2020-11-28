require "optparse"

require "cloudphoto/help"
require "cloudphoto/list"
require "cloudphoto/upload"
require "cloudphoto/download"

module Cloudphoto
  def cli(command = "help", *args)
    return Cloudphoto.help unless Cloudphoto.respond_to?(command)

    options = {}
    OptionParser.new do |opts|
      opts.on("-a", "--album ALBUM", "Album name") do |album|
        options[:album] = album
      end

      opts.on("-p", "--path path", "Path to upload/download photos to/from") do |path|
        options[:path] = path
      end

      opts.on("-h", "--help", "Print this help") do
        return Cloudphoto.help(command)
      end
    end.parse!(args)

    Cloudphoto.send(command, **options) if options
  rescue ArgumentError => e
    puts e
    Cloudphoto.help(command)
  end
  module_function :cli
end
