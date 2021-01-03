class CompletedTask < ApplicationRecord

    belongs_to :user

    validates :task_id, uniqueness: true

end


