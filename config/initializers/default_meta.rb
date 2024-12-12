# config/initializers/default_meta.rb
# Inicializa as tags meta padrão.

DEFAULT_META = YAML.load_file(Rails.root.join("config/meta.yml"))