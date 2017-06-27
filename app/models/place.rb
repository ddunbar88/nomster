class Place < ApplicationRecord
  belongs_to :user
  validates :name, length: { minimum: 2 }
  validates :name, :address, :description, presence: true
def self.search(term, page)
  if term
    where('name LIKE ?', "%#{term}%").paginate(page: page, per_page: 5).order('id DESC')
  else
    paginate(page: page, per_page: 5).order('id DESC') 
  end
 end
end