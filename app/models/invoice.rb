class Invoice < ActiveRecord::Base

  belongs_to :biller
  belongs_to :item
  belongs_to :debtor


  validates :invoice_number, :presence => {:message => '' }
  validates :logo_id, :presence => {:message => '' }
  validates :biller_id, :presence => {:message => '' }
  validates :debtor_id, :presence => {:message => '' }
  validates :item_id, :presence => {:message => '' }
  validates :description_id, :presence => {:message => '' }
  validates :date, :presence => {:message => '' }
  validates :amount, :presence => {:message => '' }
  validates :bank_detail_id, :presence => {:message => '' }




end
