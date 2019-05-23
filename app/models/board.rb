class Board < ApplicationRecord
  has_many :lists
  has_many :tasks, through: :lists
end
