class Project < ApplicationRecord

  belongs_to :user

  validates :goal, presence: true, length: { maximum: 30 }
  validates :step_1, presence: true, length: { maximum: 30 }
  validates :step_2, presence: true, length: { maximum: 30 }
  validates :step_3, presence: true, length: { maximum: 30 }
  validates :step_4, length: { maximum: 30 }
  validates :step_5, length: { maximum: 30 }
  validates :step_6, length: { maximum: 30 }

  validates :user_id, presence: true

end
