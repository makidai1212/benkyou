class Project < ApplicationRecord

  belongs_to :user

  validates :web, presence: true
end
