class Invoice < ActiveRecord::Base
  belongs_to :venue
  belongs_to :item
  belongs_to :debtor
end
