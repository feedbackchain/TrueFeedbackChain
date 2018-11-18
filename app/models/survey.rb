class Survey < ApplicationRecord
	has_many :questions, dependent: :destroy
	has_many :responses, dependent: :destroy
	has_one :profile, as: :profilable, dependent: :destroy
	accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :profile, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :responses, reject_if: :all_blank, allow_destroy: true
	validates :name, presence: true
	before_update :survey_reward, on:[:create, :update]
	before_create :survey_reward, on:[:create, :update]




private 

def survey_reward
user = User.find(self.user_id)
if user.budget.fbcbudget < (self.tempreward - self.reward) or self.tempreward < 1.0 
	errors.add(:base, 'Your Budget is not enough to submit')
	throw :abort
		
	

end
	
end








end
