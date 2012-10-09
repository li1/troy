module Troy
  # The Troy::Generator class will create a new book structure.
  #
  #   ebook = Troy::Generator.new
  #   ebook.destination_root = "/some/path/book-name"
  #   ebook.invoke_all
  #
  class Generator < Thor::Group
    include Thor::Actions

    desc "Generate a new site structure"

    def self.source_root
      File.expand_path("../../../templates", __FILE__)
    end

    def create_directories
      empty_directory "assets/javascripts"
      empty_directory "assets/stylesheets"
      empty_directory "assets/images"
      empty_directory "source"
      empty_directory "config"
      empty_directory "layouts"
    end

    def copy_files
      copy_file "helpers.rb", "config/helpers.rb"
      copy_file "default.erb", "layouts/default.erb"
      copy_file "index.erb", "source/index.erb"
      copy_file "404.erb", "source/404.erb"
      copy_file "500.erb", "source/500.erb"
    end
  end
end