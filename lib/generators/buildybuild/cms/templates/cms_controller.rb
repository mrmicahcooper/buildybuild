class <%= controller_name %> < ApplicationController

  expose(:<%= file_name.pluralize %>)
  expose(:<%= file_name %>, finder: :find_by_slug, finder_parameter: :slug)
  expose(:new_<%= file_name %>, model: <%= klass %>)

  # Move this to the ApplicationController if you want to have
  # the navigation in your Application Layout
  expose(:<%= file_name%>_slugs ) { <%= klass %>.select(:slug).map(&:slug) }

  def create
    if new_<%= file_name %>.save
      redirect_to slug_path(new_<%= file_name %>.slug)
    else
      render 'new'
    end
  end

  def update
    if <%= file_name %>.save
      redirect_to slug_path(<%= file_name %>.slug)
    else
      render 'edit'
    end
  end

  def destroy
    <%= file_name %>.destroy
    redirect_to :root, message: "#{<%= file_name %>.name} was deleted."
  end

end
