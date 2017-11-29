class Card < ApplicationRecord
  acts_as_list scope: :list

  belongs_to :list

  validates :name, presence: true
end
