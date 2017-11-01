module SimpleAuth
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      desc "Generates a custom Rails Config initializer file"

      source_root File.expand_path('../../templates', __FILE__)

      def copy_initializer
        template "simple_auth.rb", "config/initializers/simple_auth.rb"

        insert_into_file 'config/routes.rb', after: "Rails.application.routes.draw do\n" do
          <<-'RUBY'
           resources :sessions, only: [:create]
           resource :registration, only: [:create]
           resource :confirmation, only: [:update]
          RUBY
        end
      end
    end
  end
end