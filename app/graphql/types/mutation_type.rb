module Types
  class MutationType < Types::BaseObject
    field :createStudent,
          function: Mutations::Student::Create.new,
          description: 'Creates new student'

    field :updateStudent,
          function: Mutations::Student::Update.new,
          description: 'Updates existing student'

    field :deleteStudent,
          function: Mutations::Student::Delete.new,
          description: 'Delete existing student'

    field :createCoach,
          function: Mutations::Coach::Create.new,
          description: 'Creates new coach'

    field :updateCoach,
          function: Mutations::Coach::Update.new,
          description: 'Updates existing coach'

    field :deleteCoach,
          function: Mutations::Coach::Delete.new,
          description: 'Delete existing coach'
  end
end
