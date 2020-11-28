require "aws-sdk-s3"

module Cloudphoto
  module Aws
    def s3_client
      @s3_client ||= ::Aws::S3::Client.new(region: require_env("AWS_REGION"))
    end

    def s3_resource
      @s3_resource ||= ::Aws::S3::Resource.new(client: s3_client)
    end

    def bucket
      @bucket ||= require_env("CLOUDPHOTO_BUCKET")
    end

    def list_objects
      s3_client.list_objects_v2(bucket: bucket).contents.map(&:key)
    end

    def upload_object(file_path, to:)
      s3_client.put_object(bucket: bucket, key: to)
      object = s3_resource.bucket(bucket).object(to)
      File.open(file_path, 'rb') do |file|
        object.put(body: file)
      end
    rescue StandardError => e
      puts e
      false
    end

    def download_object(key:, to:)
      s3_client.get_object({ bucket: bucket, key: key }, target: to)
    end

    def require_env(key)
      return ENV[key] if ENV[key]

      raise ArgumentError.new("Missing environment variable #{key}")
    end

    module_function :require_env, :s3_client, :bucket, :list_objects,
      :upload_object, :download_object, :s3_resource
  end
end
