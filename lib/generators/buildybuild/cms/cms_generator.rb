module Buildybuild
  class CmsGenerator < Rails::Generators::Base

    source_root File.expand_path('../templates', __FILE__)

    argument :model_name, type: :string, default: "page"

    def generate_model
      template("cms_model.rb", "app/models/#{file_name}.rb")
    end

    def generate_migration
      time_stamp = Time.now.strftime('%Y%m%d%I%M%S')
      template("cms_migration.rb", "db/migrate/#{time_stamp}_create_#{file_names}.rb")
    end

    def generate_controller
      template("cms_controller.rb", "app/controllers/#{file_names}_controller.rb")
    end

    def generate_views
      template("cms_new_view.html.haml", "app/views/#{file_names}/new.html.haml")
      template("cms_edit_view.html.haml", "app/views/#{file_names}/edit.html.haml")
      template("cms_show_view.html.haml", "app/views/#{file_names}/show.html.haml")
      template("cms_form_partial.html.haml", "app/views/#{file_names}/_form.html.haml")
    end

    def add_routes
      insert_into_file "config/routes.rb", generated_routes, before: /end\n*$/
    end

    private

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

    def klasses
      file_name.pluralize.camelize
    end

    def table_name
      klasses.downcase
    end

    def controller_name
      "#{file_name.pluralize}Controller".camelize
    end

  end
end
