module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :col_sum, Integer, null: false do 
      argument :a, Integer, required: true 
      argument :b, Integer, required: true 
    end
    def col_sum (a:, b:)
      a + b
    end
  

    field :um_col, Integer, null: false do 
      argument :a, Integer, required: true 
      argument :b, Integer, required: true 
    end
    def um_col (a:, b:)
      a * b
    end

    field :post, Types::PostType do 
      argument :id, Integer, required: true 
    end
    def post (id:)
      post = Post.find(id)
    end


    field :current_user, Types::CurrentUserType, null: false do
    end
    def current_user
      {
        "id": 15,
        "user_name": "Alex"
      }
    end

    field :users, [Types::CurrentUserType], null: false do
    end
    def users
      [
        {
          "id": 15,
          "user_name":{
            "first_name": "Nick",
            "second_name": "Martin"
          }
        },
        {
          "id": 20,
          "user_name": {
            "first_name": "Bon",
            "second_name": "Jon"
          }
        }
      ]
    end

    
  end
end
