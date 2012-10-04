require 'test_helper'

class BuildybuildCmsGeneratorTest < Rails::Generators::TestCase
  tests Buildybuild::CmsGenerator
  destination File.expand_path("../../../../tmp", File.dirname(__FILE__))

  test "model" do
    output =  run_generator %w(page)
    assert output.include? "generate  model page name:string"
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
