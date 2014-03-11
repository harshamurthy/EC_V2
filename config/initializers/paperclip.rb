if Rails.env.development?
  config = YAML.load(File.read(File.expand_path("#{Rails.root}/config/application.yml", __FILE__)))
  config.merge! config.fetch(Rails.env, {})
  config.each do |key, value|
    ENV[key] = value unless value.kind_of? Hash
  end
end

    Paperclip::Attachment.default_options.merge!({
    :storage => :s3,
    :s3_protocol => 'http',
    :s3_credentials => {
      :bucket => ENV['S3_BUCKET_NAME'],
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    },
     url: ":s3_domain_url",
    path: "/:class/:attachment/:id_partition/:style/:filename"
  })
