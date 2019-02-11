module StudentDistributionHandler
  # Given 3 coaches and 20 students, the distribution should be as follows:
  # Coach 1: 7
  # Coach 2: 7
  # Coach 3: 6

  class ProblemOne
    class << self
      def call(students_list, coaches_list)
        if students_list.blank? || coaches_list.blank?
          raise 'Neither Students List nor Coaches List can\'t be empty'
        end

        coaches = coaches_list
        students = students_list
        students_per_coach = []

        min_students_per_coach = students.size / coaches.size

        max_students_per_coach = min_students_per_coach + 1

        max_coaches = students.size % coaches.size

        min_coaches = coaches.size - max_coaches

        students_per_coach = Array.new(max_coaches, max_students_per_coach) +
                             Array.new(min_coaches, min_students_per_coach)

        coaches.each_with_index do |coach, i|
          coach.students << students.pop(students_per_coach[i])
        end

        coaches.map do |coach|
          coach.students.count
        end
      end
    end
  end
end
