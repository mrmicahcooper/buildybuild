module Buildybuild
  class ActiveLinkGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    def add_active_link_helper
      insert_into_file(
        "app/helpers/application_helper.rb",
        helper_method, before: /^end\n*$/
      )
    end

    private

    def helper_method
      File.read(File.join(self.class.source_root, "active_link_helper.rb"))
    end

  end
end
