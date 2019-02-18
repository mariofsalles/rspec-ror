require 'rails_helper'

RSpec.describe Customer, type: :model do

  it '# full_name - attributes override' do
    customer = create(:customer, name: "Mario Salles")
    expect(customer.full_name).to eq("Sr. Mario Salles")
  end

  it '# full_name' do
    customer = create(:user) # or :customer, because :user is a alias in this factory
    expect(customer.full_name).to start_with("Sr. ")
  end

  it { expect{create(:customer)}.to change{Customer.all.size}.by 1 }

end
