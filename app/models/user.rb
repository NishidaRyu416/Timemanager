class User < ApplicationRecord
  has_many :lines
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
