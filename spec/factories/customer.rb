FactoryBot.define do
  factory :customer, aliases:[:user] do

    transient do
      upcased false
    end

    name { Faker::Name.name }
    #email { Faker::Internet.email }
    sequence(:email, 10) { |n| "meu_email_#{n}@email.com"}
    trait :male do
      gender 'M'
    end

    trait :female do
      gender 'F'
    end

    trait :vip do
      vip true
      days_to_pay 30
    end

    trait :default do
      vip false
      days_to_pay 15
    end

    factory :customer_male, traits: [:male]
    factory :customer_female, traits: [:female]
    factory :customer_vip, traits: [:vip]
    factory :customer_default, traits: [:default]
    factory :customer_vip_male, traits: [:vip, :male]
    factory :customer_vip_female, traits: [:vip, :female, ]
    factory :customer_default_male, traits: [:default, :male]
    factory :customer_default_female, traits: [:default, :male]

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
    
  end
end