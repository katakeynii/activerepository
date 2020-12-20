# frozen_string_literal: true

require 'rails/generators/named_base'
require "rails/generators/active_record"

module Rails
  module Generators
    class RepositoryGenerator < Rails::Generators::NamedBase
      include Rails::Generators::ResourceHelpers
    #   argument :nodes, type: :array, default: [], banner: "node_name[:type] node_name[:type]"
        source_root File.expand_path('templates', __dir__)
      # creates the migration file for the model.

      def create_repository_file
        generate_abstract_class 
		@module_name = options[:module]

		service_dir_path = "app/repositories"
		generator_dir_path = service_dir_path + ("/#{@module_name.underscore}" if @module_name.present?).to_s
        generator_path = generator_dir_path + "/#{file_name}_repository.rb"

		Dir.mkdir(service_dir_path) unless File.exist?(service_dir_path)
		Dir.mkdir(generator_dir_path) unless File.exist?(generator_dir_path)
        
        template "repository.rb", File.join("app/repositories", class_path, "#{file_name}_repository.rb")
      end


      private 

      def generate_abstract_class
        path = File.join("app/repositories", "application_repository.rb")
        return if File.exist?(path)

        template "abstract_class.rb", path
      end      


    end
  end
end