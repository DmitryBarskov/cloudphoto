module Cloudphoto
  def help(command = nil)
    puts <<~HELP
    Usage: cloudphoto <command> [options]
    Available commands:
      download - download album from cloud storage
      upload - upload photos to cloud storage
      list - show ablum names in cloud storage
    HELP

    puts Help.send("help_#{command}") if command && respond_to?(command)
  end
  module_function :help

  module Help
    def help_upload
      <<~HELP
        cloudphoto upload -p path -a album
        Upload all photos in **path** directory to **album** album
      HELP
    end

    def help_download
      <<~HELP
        cloudphoto download -p path -a album
        Download all photos from **album** album to **path** directory
      HELP
    end

    def help_list
      <<~HELP
        cloudphoto list -a album
        List available photos in **album** album
      HELP
    end
    module_function :help_list, :help_download, :help_upload
  end
end
