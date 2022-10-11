class Check < ApplicationRecord
  belongs_to :user
  belongs_to :vaccination_record
end
