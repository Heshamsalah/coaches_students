# frozen_string_literal: true

# Coach Model
class Coach < ApplicationRecord
  has_and_belongs_to_many :students
end
