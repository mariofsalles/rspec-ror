require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :all
  it 'Create a customer' do
    customer = customers(:mario) #retorna na var customer o que está na fixture customers com o simbolo especificado
    expect(customer.full_name).to eq("Sr. Mario Salles")
  end

end
