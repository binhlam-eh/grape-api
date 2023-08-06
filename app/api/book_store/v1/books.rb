module BookStore
  module V1
    class Books < Grape::API
      include BookStore::V1::Defaults

      resource :books do
        desc 'Return list of books'
        get do
          books = Book.all
          present books, with: BookStore::Entities::Index
        end

        route_param :id do
          desc 'Return a specific book'
          params do
            requires :id, type: String, desc: 'Id of specific book'
          end
          get do
            book = Book.find(permitted_params[:id])
            present book, with: BookStore::Entities::Book
          end

          resource :flows do
            desc 'Create a flow'
            params do
              requires :id, type: String, desc: 'Id of specific book'
              requires :flow, type: Hash do
                requires :newStock, type: Integer, desc: 'New Stock'
                requires :previousStock, type: Integer, desc: 'Previous Stock'
              end
            end
            post do
              @book = Book.find(permitted_params[:id])
              @flow = Flow.new(permitted_params[:flow])
              @flow = @book.flows.create!(permitted_params[:flow])
              @book.update(stock: @flow.newStock)
            end
          end

        end

      end
    end
  end
end
