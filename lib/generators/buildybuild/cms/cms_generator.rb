module Buildybuild
  class CmsGenerator < Rails::Generators::Base

    source_root File.expand_path('../templates', __FILE__)

    argument :model_name, type: :string, default: "page"

    def generate_model
      generate("model #{model_name} name:string body:text")
    end

    def update_generated_model
      after_string = "class #{model_name.camelize} < ActiveRecord::Base\n"
      insert_string = "\n  attr_accessible :name, :body\n\n  default_scope order('created_at DESC, updated_at DESC')\n\n  def self.find_by_slug(slug)\n    Page.find_by_name(slug)\n  end\n\n"
      insert_into_file "app/models/#{file_name}.rb", insert_string, after: after_string
    end

    def generate_controller
      template("cms_controller.rb" , "app/controllers/#{file_name}_controller.rb")
    end

    def generate_views
      template("cms_new_view.html.haml", "app/views/#{file_names}/new.html.haml")
      template("cms_edit_view.html.haml", "app/views/#{file_names}/edit.html.haml")
      template("cms_show_view.html.haml", "app/views/#{file_names}/show.html.haml")
      template("cms_form_partial.html.haml", "app/views/#{file_names}/_form.html.haml")
    end

    private

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
      "#{file_name.pluralize}controller".camelize
    end

  end
end
