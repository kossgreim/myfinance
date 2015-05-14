class Category < ActiveRecord::Base
  ## Relations
  belongs_to :user

  ## Validations
  validates :user, :name, presence: true
end
