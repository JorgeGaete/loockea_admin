module AdminsHelper
  
  def gravatar_for(admin, options = {size: 50})
    gravatar_id = Digest::MD5::hexdigest(admin.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: admin.name, class: "gravatar")
  end
end
