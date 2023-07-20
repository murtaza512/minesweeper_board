class Board < ApplicationRecord
  validates :email, presence: true, length: { maximum: 50 }
  validates :mines, presence: true
  validates :rows, presence: true
  validates :cols, presence: true
end
