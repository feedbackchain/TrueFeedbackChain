class User < ApplicationRecord
	has_many :surveys, dependent: :destroy
	has_many :responses, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
         accepts_nested_attributes_for :surveys, reject_if: :all_blank, allow_destroy: true
         accepts_nested_attributes_for :responses, reject_if: :all_blank, allow_destroy: true








end
