class Question < ApplicationRecord
  validates :content, presence: true
  belongs_to :survey
  has_many :answers, dependent: :destroy
end
