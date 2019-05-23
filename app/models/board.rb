class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :tasks, through: :lists
end
