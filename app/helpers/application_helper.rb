module ApplicationHelper
  def inside_layout(layout, &block)
    layout = "layouts/#{layout}" unless layout =~ %r[\Alayouts/]
    content_for :content, capture(&block)
    render template: layout
  end

  def controller?(*controller)
    puts params[:controller]
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end
end
