require 'rails_helper'

describe Invoice do
  describe 'relationships' do
    it {should belong_to :user}
    it {should belong_to :merchant}
    it {should have_many :invoice_items}
    it {should have_many(:items).through(:invoice_items)}
  end
end