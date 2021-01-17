require 'csv'

desc "Import CSV data"
  task import: :environment do

    puts 'Destroying the database'
    InvoiceItem.destroy_all
    Invoice.destroy_all
    Item.destroy_all
    Merchant.destroy_all
    User.destroy_all

    CSV.foreach('db/data/users.csv', headers: true, header_converters: :symbol) do |row|
      User.create!({
        id: row[:id],
        email: row[:email],
        api_key: row[:api_key],
        password: row[:api_key],
        created_at: row[:created_at],
        updated_at: row[:updated_at]
        })
    end
    puts "#{User.count} customers have been created"

    CSV.foreach('db/data/merchants.csv', headers: true, header_converters: :symbol) do |row|
      Merchant.create!({
        id: row[:id],
        name: row[:name],
        created_at: row[:created_at],
        updated_at: row[:updated_at]
        })
    end
    puts "#{Merchant.count} merchants have been created"

    CSV.foreach('db/data/items.csv', headers: true, header_converters: :symbol) do |row|
      Item.create({
        id: row[:id],
        name: row[:name],
        description: row[:description],
        photo: row[:photo],
        unit_price: row[:unit_price].to_f/100,
        merchant_id: row[:merchant_id],
        created_at: row[:created_at],
        updated_at: row[:updated_at]
      })
    end
    puts "#{Item.count} items have been created"

    CSV.foreach('db/data/invoices.csv', headers: true, header_converters: :symbol) do |row|
      Invoice.create!({
        id: row[:id],
        user_id: row[:user_id],
        merchant_id: row[:merchant_id],
        created_at: row[:created_at],
        updated_at: row[:updated_at]
      })
    end
    puts "#{Invoice.count} invoices have been created"

    CSV.foreach('db/data/invoice_items.csv', headers: true, header_converters: :symbol) do |row|
      InvoiceItem.create!({
        id: row[:id],
        item_id: row[:item_id],
        invoice_id: row[:invoice_id],
        quantity: row[:quantity],
        unit_price: row[:unit_price].to_f/100,
        created_at: row[:created_at],
        updated_at: row[:updated_at]
        })
    end
    puts "#{InvoiceItem.count} invoice items have been created"

    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end

    puts 'Congratulations. You have imported the data!'
  end