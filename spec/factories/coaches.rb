FactoryBot.define do
  factory :coach do
    name { Faker::Name.name }
    capacity { 0 }
  end

  factory :coach_with_students, parent: :coach do
    transient do
      students_count { 5 }
      capacity { 0 }
    end

    after(:create) do |coach, options|
      coach.students << create_list(:student, options.students_count)
      coach.capacity = options.capacity
      coach.save!
    end
  end
end
