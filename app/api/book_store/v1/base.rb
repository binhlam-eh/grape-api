require "grape-swagger"

module BookStore
  module V1
    class Base < Grape::API
      mount BookStore::V1::Books
      
      add_swagger_documentation(
        api_version: "v1",
        hide_documentation_path: true,
        mount_path: "/api/documentation",
        hide_format: true
      )
    end
  end
end
