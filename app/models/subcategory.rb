class Subcategory < ActiveRecord::Base
  belongs_to :category
  ## validations
  validates :name, :category, presence: true
end
