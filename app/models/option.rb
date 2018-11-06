class Option < ApplicationRecord
  belongs_to :question
  has_many :answers, dependent: :destroy
  validates :otext, presence: true
end
