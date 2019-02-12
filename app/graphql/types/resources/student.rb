module Types
  module Resources
    class Student < Types::BaseObject
      field :id, String, null: false
      field :created_at, String, null: false
      field :updated_at, String, null: false
      field :name, String, null: true
      field :coaches, [Types::Resources::Coach], null: true
    end
  end
end
