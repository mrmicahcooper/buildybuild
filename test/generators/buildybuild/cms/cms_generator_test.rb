require 'test_helper'

class BuildybuildCmsGeneratorTest < Rails::Generators::TestCase
  tests Buildybuild::CmsGenerator
  destination File.expand_path("../../../../tmp", File.dirname(__FILE__))
  setup :prepare_destination

  test "model" do
    generator.generate_model
    assert_file "app/models/page.rb", /class Page/
  end

  test "update_model" do

  end

  test "controller" do
    generator.generate_controller
    assert_file "app/controllers/pages_controller.rb"
  end

  test "views" do
    generator.generate_views
    assert_file "app/views/pages/show.html.haml", /:markdown/
    assert_file "app/views/pages/edit.html.haml", / render partial: "form", locals: { f:f }/
    assert_file "app/views/pages/new.html.haml", / render partial: "form", locals: { f:f }/
    assert_file "app/views/pages/_form.html.haml", /f\.label :name/
  end

end
