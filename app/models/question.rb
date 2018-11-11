class Question < ApplicationRecord
  belongs_to :survey
  has_many :options, dependent: :destroy
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  validates :title, presence: true
end
