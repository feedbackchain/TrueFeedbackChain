class Option < ApplicationRecord
  belongs_to :question
  has_many :answers, dependent: :destroy
  validates :otext, presence: true
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
end
