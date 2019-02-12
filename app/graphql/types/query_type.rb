module Types
  class QueryType < Types::BaseObject
    field :students,
          function: Queries::Student::Index.new,
          description: 'Return list of students'

    field :student,
          function: Queries::Student::Show.new,
          description: 'Find student by id'

    field :coaches,
          function: Queries::Coach::Index.new,
          description: 'Return list of coaches'

    field :coach,
          function: Queries::Coach::Show.new,
          description: 'Find coach by id'
  end
end
