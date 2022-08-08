class Job < ApplicationRecord
    validates :name, presence: true
    validates :status , presence: true, inclusion: { in: %w(in_queue in_progress failed done), message: "%{value} should be one of these in_queue, in_progress, failed, done." }
    validates :priority, presence: true, inclusion: { in: 1..3, message: "%{value} should be 1 or 2 or 3, with 1 being the highest priority" }

    scope :order_by_time, -> { order(created_at: :asc) }
    scope :order_by_priority, -> { order(priority: :asc) }

    def execute_job
        puts "Job got executed"
        self.status = "done"
        begin
            self.save
            return self
        rescue e
            raise Error.new("Unable to update record")
        end
    end
end
