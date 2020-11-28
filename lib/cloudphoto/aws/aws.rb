require "aws-sdk-s3"

module Cloudphoto
  module Aws
    def s3_client
      @s3_client ||= ::Aws::S3::Client.new(region: ENV['AWS_REGION'])
    end

    def bucket
      @bucket = ENV['CLOUDPHOTO_BUCKET']
    end

    def list_objects
      s3_client.list_objects_v2(bucket: bucket).contents.map(&:key)
    end
    module_function :s3_client, :bucket, :list_objects
  end
end
