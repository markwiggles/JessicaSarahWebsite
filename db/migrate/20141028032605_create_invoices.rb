class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :date
      t.string :invoice_number
      t.integer :amount
      t.integer :gst
      t.references :venue, index: true
      t.references :item, index: true
      t.references :debtor, index: true

      t.timestamps
    end
  end
end
