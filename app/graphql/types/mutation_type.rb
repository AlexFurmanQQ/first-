module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    field :post_delete_by_pk, Types::PostType do 
      argument :id, Integer, required: true 
    end
    def post_delete_by_pk (id:)
      post = Post.find(id)
      post.destroy
    end
  end
end
