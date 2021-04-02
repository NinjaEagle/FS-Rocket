class Contact < ApplicationRecord
  validates :_id, :contactId, :contactName, uniqueness: true
end
