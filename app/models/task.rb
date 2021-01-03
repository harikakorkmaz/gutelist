class Task < ApplicationRecord
    belongs_to :user
    validates :task_ja, presence: true, length: {minimum: 4}
    validates :task_en, presence: true, length: {minimum: 5}
end
