if Rails.env.development?
  config = YAML.load(File.read(File.expand_path("#{Rails.root}/config/application.yml", __FILE__)))
  config.merge! config.fetch(Rails.env, {})
  config.each do |key, value|
    ENV[key] = value unless value.kind_of? Hash
  end
end
