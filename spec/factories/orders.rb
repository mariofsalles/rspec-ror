FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Pedido número - #{n}"}
    association :customer, factory: :customer # is equal to customer 
  end
end
