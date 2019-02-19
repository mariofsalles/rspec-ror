require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Have one order' do
    customer = create(:customer)
    order = create(:order, customer: customer)
    expect(order.customer).to be_kind_of(Customer)
  end
end
