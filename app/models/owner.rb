class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :informations ,dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :relationships, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true
  validates :address, presence: true
  validates :telphone_number, presence: true
end
