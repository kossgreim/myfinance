class Category < ActiveRecord::Base
  ## Relations
  belongs_to :user
  has_many :subcategories

  ## Validations
  validates :user, :name, presence: true
end
