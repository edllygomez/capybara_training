require 'yaml'

class Selector

  YAMLS_PATH = "#{Rails.root}/spec/config/selectors/"

  attr_accessor :selectors

  def initialize
    @selectors = {}
    load_yamls
    define_selectors
  end

  def load_yamls
    yamls.each { |file| populate(file) }
  end

  def populate(file)
    yml = load_yaml(file)
    key = yml.keys.first
    update_selectors(key, yml[key]) if key
  rescue => ex
    p "Error loading selectors file: #{file}"
  end

  def update_selectors(key, hash)
    if selectors[key]
      selectors[key].merge!(hash)
    else
      selectors[key] = hash
    end
  end

  def load_yaml(yaml_file)
    YAML.load_file("#{YAMLS_PATH}#{yaml_file}")
  end

  def yamls
    Dir.entries(YAMLS_PATH).select { |item| item.end_with?('.yml') }
  end

  def define_selectors
    selectors.each { |key, hash| create_method(key, hash) }
  end

  def create_method(engine_key, engine_selectors)
    engine_selectors.each do |key, value|
      define_singleton_method("#{engine_key}_#{key}".to_sym) { value }
    end
  end

  class << self

    def method_missing(name, *args, &block)
      instance.send(name, *args, &block)
    end

    private

    def instance
      @instance ||= new
    end
  end
end
