class User < ApplicationRecord
	has_many :surveys, dependent: :destroy
end
