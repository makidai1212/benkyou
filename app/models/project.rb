class Project < ApplicationRecord

  belongs_to :user

  validates :goal, presence: true
  validates :step_1, presence: true
  validates :step_2, presence: true
  validates :step_3, presence: true
  validates :step_4, presence: true
  validates :step_5, presence: true
  validates :step_6, presence: true
  validates :user_id, presence: true

end
