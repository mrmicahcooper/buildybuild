module Buildybuild
  class CmsGenerator < Rails::Generators::Base

    source_root File.expand_path('../templates', __FILE__)

    argument :model_name, type: :string, default: "page"

    def generate_model
      generate("model #{model_name} name:string slug:string body:text")
    end

    # def update_generated_model
    #  after_string = "attr_accessible :body, :name, :slug"
    #  insert_into_file "app/models/#{file_name}.rb", generated_model, after: after_string
    # end

    def generate_controller
      template("cms_controller.rb", "app/controllers/#{file_names}_controller.rb")
    end

    def generate_views
      template("cms_new_view.html.haml", "app/views/#{file_names}/new.html.haml")
      template("cms_edit_view.html.haml", "app/views/#{file_names}/edit.html.haml")
      template("cms_show_view.html.haml", "app/views/#{file_names}/show.html.haml")
      template("cms_form_partial.html.haml", "app/views/#{file_names}/_form.html.haml")
    end

    # def add_route
    #   insert_into_file "config/routes.rb", generated_routes, before: /end\n*$/
    # end

    private

    def generated_model
  %Q(
  default_scope order('created_at DESC, updated_at DESC')\n
  validates_uniqueness_of :name\n
  before_save :update_slug\n
  def update_slug
   self.slug = name.parameterize
  end\n)
    end

    def generated_routes
  %Q(
  resources :pages, only: [:new, :create]

  #keep these at the bottom of your file. They should be the last routes.
  get "/:slug", to: "pages#show", as: :slug
  get "/:slug/edit", to: "pages#edit", as: :edit_slug
  put "/:slug", to: "pages#update", as: :slug
  post "/:slug", to: "pages#destroy", as: :slug\n)
    end


    def file_name
      model_name.underscore
    end

    def file_names
      model_name.pluralize.underscore
    end

    def klass
      file_name.camelize
    end

    def controller_name
      "#{file_name.pluralize}Controller".camelize
    end

  end
end
