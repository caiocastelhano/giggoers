# app/helpers/meta_tags_helper.rb
module MetaTagsHelper
  def meta_title
    # Verifica se foi definido um valor para :meta_title, caso contrário usa o valor padrão do meta.yml
    content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META["meta_title"]
  end

  def meta_description
    # Verifica se foi definido um valor para :meta_description, caso contrário usa o valor padrão do meta.yml
    content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META["meta_description"]
  end

  def meta_image
    # Verifica se foi definido um valor para :meta_image, caso contrário usa o valor padrão do meta.yml
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["meta_image"])
    
    # Se a imagem for uma URL completa (começar com "http"), usa diretamente
    # Caso contrário, assume que é um caminho de imagem dentro do assets
    meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end
end
