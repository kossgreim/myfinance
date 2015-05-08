class Account < ActiveRecord::Base
  belongs_to :user
  validates :user, :name, presence: true
end
