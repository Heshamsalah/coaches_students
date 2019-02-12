module Types
  module Resources
    class Coach < Types::BaseObject
      field :id, String, null: false
      field :created_at, String, null: false
      field :updated_at, String, null: false
      field :name, String, null: true
      field :capacity, Int, null: true
      field :students, [Types::Resources::Student], null: true
    end
  end
end
