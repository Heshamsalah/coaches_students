class Solutions
  class << self
    def solution_one(coaches_count, students_count)
      min_students_per_coach = students_count / coaches_count

      max_students_per_coach = min_students_per_coach + 1

      max_coaches = students_count % coaches_count

      min_coaches = coaches_count - max_coaches

      Array.new(max_coaches, max_students_per_coach) +
        Array.new(min_coaches, min_students_per_coach)
    end

    def solution_two(coaches, students)
      max = coaches.max
      no_of_coaches = coaches.size

      coaches.map! do |s|
        needed = max - s
        to_add = [needed, students].min
        students -= to_add
        s + to_add
      end

      result = solution_one(no_of_coaches, students)

      coaches.zip(result).map(&:sum)
    end

    def solution_three(coaches, students)
      extra_students = 0

      coaches.map! do |n|
        percentage = n * 0.01
        students_for_this_coach = percentage * students
        extra_students += (students_for_this_coach - students_for_this_coach.floor)
        students_for_this_coach.floor
      end

      solution_two(coaches, extra_students.to_i)
    end

    def assign_students_to_coaches(students, coaches, students_per_coach)
      coaches.each_with_index do |coach, i|
        coach.students << students.pop(students_per_coach[i])
      end

      coaches.map do |coach|
        coach.students.count
      end
    end
  end
end
