FactoryBot.define do
  factory :coach do
    name { Faker::Name.name }
  end

  factory :coach_with_students, parent: :coach do
    transient do
      students_count { 5 }
    end

    after(:create) do |coach, options|
      coach.students << create_list(:student, options.students_count)
    end
  end
end
