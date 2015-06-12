class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :name, :last_name, presence: true

  has_many :categories
  has_many :accounts
  has_many :subcategories, :through => :categories

  def full_name 
  	"#{self.name} #{self.last_name}"
  end
end
