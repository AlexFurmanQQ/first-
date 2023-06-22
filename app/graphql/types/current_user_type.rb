module Types
    class CurrentUserType < Types::BaseObject
      field :id, ID, null: false
      field :user_name, UserNameType, null: false
    end
  end