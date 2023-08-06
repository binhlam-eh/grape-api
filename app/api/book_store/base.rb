module BookStore
  class Base < Grape::API
    mount BookStore::V1::Base
  end
end
