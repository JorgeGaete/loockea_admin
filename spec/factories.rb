FactoryGirl.define do
  factory :admin do
    sequence(:name)       { |n| "Person #{n}" }
    sequence(:email)      { |n| "person_#{n}@example.com" }
    password              "foobar"
    password_confirmation "foobar"
    
    factory :super_admin do
      super_admin true
    end
  end
end