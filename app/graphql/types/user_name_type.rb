module Types
    class UserNameType < Types::BaseObject
      field :first_name, String, null: false
      field :second_name, String, null: false
    end
end