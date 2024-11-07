class Answer < ApplicationRecord
  validates :response, presence: true
  belongs_to :question
end
