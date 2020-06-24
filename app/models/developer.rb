class Developer < ApplicationRecord
  has_one :user, as: :profile
end
