FactoryBot.define do
  factory :student do
    name { Faker::Name.name }
  end

  factory :student_with_coaches, parent: :student do
    transient do
      coaches_count { 5 }
    end

    after(:create) do |student, options|
      student.coaches << create_list(:coach, options.coaches_count)
    end
  end
end
