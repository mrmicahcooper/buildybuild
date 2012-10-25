require 'test_helper'

class BuildybuildActiveLinkGeneratorTest < Rails::Generators::TestCase
  tests Buildybuild::ActiveLinkGenerator
  destination File.expand_path("../../../../tmp", File.dirname(__FILE__))
  setup :prepare_destination

  test "ApplicationHelper is updated" do
    #create the file in the test so we can insert into it.
    generator.create_file("app/helpers/application_helper.rb", "module ApplicationHelper \n\nend")
    generator.add_active_link_helper
    assert_file "app/helpers/application_helper.rb", /  def active_link_to\(text, path, options=\{\}\)/
  end

end
