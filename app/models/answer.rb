class Answer < ApplicationRecord
  validates :response, presence: true
  belongs_to :question, optional: true
  belongs_to :user
end
