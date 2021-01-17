class Merchant < ApplicationRecord
  validates :name, presence: true

  has_many :invoices
  has_many :items
  
  scope :filter_by_name, -> (name) { where("lower(name) like ?", "%#{name.downcase}%")}
  scope :filter_by_id, -> (id) { where id: id }
  scope :filter_by_created_at, -> (created_at) { where("Date(created_at) = ?", "#{created_at}%")}
  scope :filter_by_updated_at, -> (updated_at) { where("Date(updated_at) = ?", "#{updated_at}%") }
end