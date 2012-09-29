class <%= controller_name %> < ApplicationController

  expose(:<%= file_name.pluralize %>)
  expose(:<%= file_name %>)
  expose(:<%= file_name%>_slugs ) { <%= klass %>.select(:name) }

  def create
    if <%= file_name %>.save
      redirect_to :<%= file_name %>
    else
      render 'new'
    end
  end

  alias create update

  def destroy
    <%= file_name %>.destroy
    redirect_to :root_path, message: "#{<%= file_name %>.name} was deleted."
  end

end
