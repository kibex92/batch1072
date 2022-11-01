class Patient < ActiveRecord::Base
  has_many :consultations
end