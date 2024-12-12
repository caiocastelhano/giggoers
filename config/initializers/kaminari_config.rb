Kaminari.configure do |config|
  config.default_per_page = 10  # Ajuste o número de itens por página globalmente
  config.max_per_page = 100
  config.window = 4
  config.outer_window = 0
  config.left = 2
  config.right = 2
end