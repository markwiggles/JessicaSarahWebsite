class CreateInvoiceNumbers < ActiveRecord::Migration

  def change

    create_table :invoice_numbers do |t|
      t.string :name
      t.string :date
      t.integer :seq_number
      t.string :identifier
      t.string :invoice_number
      t.references :invoices, index2: true
      t.timestamps
    end
  end
end

