require 'rails_helper'

RSpec.describe Customer, type: :model do

  it '# full_name - attributes override' do
    customer = create(:customer, name: "Mario Salles")
    customer1 = create(:customer, name: "Mario Salles")
    expect(customer.full_name).to eq("Sr. Mario Salles")
  end

  it '# full_name - customer vip' do
    customer = create(:customer_vip)
    expect(customer.vip).to eq(true)
  end

  it '# full_name - customer default' do
    customer = create(:customer_default)
    expect(customer.days_to_pay).to eq(15)
  end

  it '# full_name' do
    customer = create(:user) # or :customer, because :user is a alias in this factory
    expect(customer.full_name).to start_with("Sr. ")
  end

  it '# using attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with("Sr.")
  end
  
  it '# using transient attributes' do
    customer = create(:customer, upcased: true)
    # puts attributes_for(:customer_default)
    expect(customer.name.upcase).to eq(customer.name)
  end

  it '# male vip client' do
    customer = create(:customer_vip_male)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(true)
  end

  it '# travel_to' do
      travel_to Time.zone.local(2004, 11, 24, 01, 04, 44) do 
      @customer = create(:customer_vip)
    end
    expect(@customer.created_at).to be < Time.now
  end

  it { expect{create(:customer)}.to change{Customer.all.size}.by 1 }

end
