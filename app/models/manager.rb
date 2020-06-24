class Manager < ApplicationRecord
  has_one :user, as: :profile
end
