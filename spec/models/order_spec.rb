require 'rails_helper'

RSpec.describe Order, type: :model do
  it '# belongs_to' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
  end

  it '# have three orders - create_list' do
    orders = create_list(:order, 3)
    expect(orders.count).to eq(3)
  end

  it '# has_many' do
    customer0 = create(:customer_with_orders) # without override or using pattern transient eq 3
    customer1 = create(:customer_with_orders, qtt_orders: 5) # with override
    expect(customer0.orders.count).to eq(3)
    expect(customer1.orders.count).to eq(5)
  end
end
