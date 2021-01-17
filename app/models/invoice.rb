class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :merchant
  has_many :invoice_items, dependent: :destroy
  has_many :items, through: :invoice_items
end
