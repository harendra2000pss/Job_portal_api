class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :job_applications

  validates :name, presence: true
  validates :password, length: { minimum: 6 }, if: -> { password.present? }
  validates :email, presence: true, uniqueness: true
end
