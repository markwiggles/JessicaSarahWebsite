class InvoiceNumber< ActiveRecord::Base

  before_save 'createInvoiceNumber'






  def createInvoiceNumber

    # get the last seq number
    last_number = InvoiceNumber.last.seq_number

    if last_number != nil
      new_number = last_number += 1
      # assign the new seq number
      self.seq_number = new_number
    else
      new_number = 1
      self.seq_number = new_number
    end
    self.invoice_number = "#{self.name}#{new_number}"
  end


end