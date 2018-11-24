class User < ApplicationRecord
	has_many :surveys, dependent: :destroy
	has_many :responses, dependent: :destroy
	has_one :budget, dependent: :destroy
   has_one :profile, as: :profilable, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable
    accepts_nested_attributes_for :surveys, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :responses, reject_if: :all_blank, allow_destroy: true
    accepts_nested_attributes_for :budget, reject_if: :all_blank, allow_destroy: true



 after_create :create_budget, on: :create


  def self.current
    Survey.current[:user]
  end
  def self.current=(user)
    Survey.current[:user] = user
  end



  private
  def create_budget
    budget = self.create_budget!
    budget.save
  end




end
