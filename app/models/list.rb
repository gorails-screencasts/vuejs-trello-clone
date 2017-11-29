class List < ApplicationRecord
  acts_as_list

  has_many :cards, ->{ order(position: :asc) }, dependent: :destroy

  scope :sorted, ->{ order(position: :asc) }

  validates :name, presence: true
end
