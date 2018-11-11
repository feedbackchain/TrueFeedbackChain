class Survey < ApplicationRecord
	has_many :questions, dependent: :destroy
	has_many :responses, dependent: :destroy
	accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :responses, reject_if: :all_blank, allow_destroy: true
	validates :name, presence: true
end
