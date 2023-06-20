module Types
    class Post < Types::BaseObject  
        field :id, GraphQL::Types::ID, null: false
        field :title, String, null: false
        field :body, String, null: false
        field :view, Integer, null: true
        field :publication_date, GraphQL::Types::ISO8601DateTime, null: false
        field :is_deleted, GraphQL::Types::ISO8601DateTime, null: false
        field :created_at, GraphQL::Types::ISO8601DateTime, null: false
        field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    end
end