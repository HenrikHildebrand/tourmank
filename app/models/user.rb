class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :teams
  has_many :tournaments, through: :teams

  accepts_nested_attributes_for :teams, allow_destroy: true

end
