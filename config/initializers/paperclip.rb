# TODO: You don't need to require these settings in an initializer
# this was preventing me to run the app, you should always try to keep the setup
# of you app easy for new developers and you don't need to require those setting
# for the app to start. I've added a new class in the lib folder called StorageConfiguration
# this class keeps all the settings there and if you don't have the env vars it fallsback to 
# file system instead of S3 so I can run the app in devlopment wihout setting up S3 and etc.
# It's also better to do this way because you don't keep the keys for S3 on your machine, just
# on Heroku's ENV vars minimizing chances of security problems.

# if Rails.env.development?
#   config = YAML.load(File.read(File.expand_path("#{Rails.root}/config/application.yml", __FILE__)))
#   config.merge! config.fetch(Rails.env, {})
#   config.each do |key, value|
#     ENV[key] = value unless value.kind_of? Hash
#   end
# end
# 
# Paperclip::Attachment.default_options.merge!({
#   :storage => :s3,
#   :s3_protocol => 'http',
#   :s3_credentials => {
#     :bucket => ENV['S3_BUCKET_NAME'],
#     :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
#     :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
#   },
#    url: ":s3_domain_url",
#   path: "/:class/:attachment/:id_partition/:style/:filename"
# })
