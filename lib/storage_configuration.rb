class StorageConfiguration
  def self.for_attachments
    storage_configuration
  end

  private

  def self.storage_configuration
    if environment_specifies_amazon_config?
      {
        storage: :s3,
        s3_credentials: {
          access_key_id: ENV["AMAZON_S3_ACCESS_KEY"],
          secret_access_key: ENV["AMAZON_S3_SECRET_KEY"]
        },
        bucket: ENV["AMAZON_S3_BUCKET"]
      }
    else
      {
        storage: :filesystem
      }
    end
  end

  def self.environment_specifies_amazon_config?
    ENV.has_key?("AMAZON_S3_ACCESS_KEY") && ENV.has_key?("AMAZON_S3_SECRET_KEY")
  end
end