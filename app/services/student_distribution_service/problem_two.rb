module StudentDistributionService
  # Some coaches may already have students.

  # Given 3 coaches:
  # Coach 1: 7 students
  # Coach 2: 7 students
  # Coach 3: 6 students

  # And given a new list of 10 students, the final distribution would be:
  # Coach 1: 10 students
  # Coach 2: 10 students
  # Coach 3: 10 students

  class ProblemTwo < StudentDistributionService::Solutions
    class << self
      def call(students_list, coaches_list)
        validate_presence_of(students_list, coaches_list)

        list_of_students_per_coach = coaches_list.map do |coach|
          coach.students.count
        end

        assign_students_to_coaches(
          students_list,
          coaches_list,
          solution_two(list_of_students_per_coach, students_list.size),
        )
      end
    end
  end
end
