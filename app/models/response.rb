class Response < ApplicationRecord
	belongs_to :user
  belongs_to :survey
  has_many :answers, dependent: :destroy
  validates :survey, presence: true
  
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  #accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true
end
