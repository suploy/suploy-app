module ApplicationHelper
  def inside_layout(layout, &block)
    layout = "layouts/#{layout}" unless layout =~ %r[\Alayouts/]
    content_for :content, capture(&block)
    render template: layout
  end

  def gravatar_url(user, size=20)
    stripped_email = user.email.strip
    hash = Digest::MD5.hexdigest(stripped_email)
    "https://secure.gravatar.com/avatar/#{hash}?s=#{size}"
  end

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end
end
