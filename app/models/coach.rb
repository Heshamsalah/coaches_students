# frozen_string_literal: true

# Coach Model
class Coach < ApplicationRecord
  has_and_belongs_to_many :students

  validates :capacity, numericality: { less_than_or_equal_to: 100 }
end
