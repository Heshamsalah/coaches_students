module StudentDistributionService
  # Given 3 coaches:
  # Coach 1: 30% capacity
  # Coach 2: 20% capacity
  # Coach 3: 50% capacity

  # And given a new list of 100 students, the final distribution would be:
  # Coach 1: 30 students
  # Coach 2: 20 students
  # Coach 3: 50 students

  class ProblemThree < StudentDistributionService::Solutions
    class << self
      def call(students_list, coaches_list)
        validate_presence_of(students_list, coaches_list)

        list_of_coaches_capacity = coaches_list.map do |coach|
          coach.capacity
        end

        assign_students_to_coaches(
          students_list,
          coaches_list,
          solution_three(list_of_coaches_capacity, students_list.size),
        )
      end
    end
  end
end
