class CreateInvoices < ActiveRecord::Migration
def change

  create_table :invoices do |t|
    t.string :date
    t.string :invoice_number
    t.integer :amount
    t.integer :gst
    t.references :description, index2: true
    t.references :item, index2: true
    t.references :debtor, index2: true
    t.references :biller, index2: true
    t.references :bank_detail, index2: true
    t.references :logo, index2: true

    t.timestamps
  end
end
end
