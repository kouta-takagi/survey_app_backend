class Question < ApplicationRecord
  validates :content, presence: true
  belongs_to :survey, optional: true
  has_many :answers, dependent: :destroy
end
