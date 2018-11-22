class Profile < ApplicationRecord
  belongs_to :profilable, polymorphic: true, optional: true
  enum gender: ["Female", "Male"]
  enum lang: ["English", "Deutsche", "Francais", "Español", "Chinese", "Korean", "Turkish"]
#attr_accessor :country_code, :state_code
validates :country_code, :state_code, :birthday, presence: true, if: :profilable_type?



def profilable_type?
self.profilable_type == "User"
	
end





end
